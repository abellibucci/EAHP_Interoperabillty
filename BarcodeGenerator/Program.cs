using System.Text.Json;
using NanoidDotNet;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using ZXing;
using ZXing.Common;
using ZXing.Rendering;

Console.WriteLine("Starting...");

var outputDir = "Barcodes";

if (Directory.Exists(outputDir))
    Directory.Delete(outputDir, true);

Directory.CreateDirectory(outputDir);

var text = File.ReadAllText("BarcodeInput.json");
var barcodes = JsonSerializer.Deserialize<BarcodeData[]>(text);
ArgumentNullException.ThrowIfNull(barcodes);

var svgRenderer = new SvgRenderer();
var pixelRenderer = new PixelDataRenderer();

var options = new EncodingOptions
{
    PureBarcode = true,
    Margin = 1,
    Height = 200,
    Width = 200
};
var writer = new BarcodeWriterGeneric
{
    Format = BarcodeFormat.DATA_MATRIX,
    Options = options
};



foreach (var barcode in barcodes)
{
    var path = Path.Combine(outputDir, barcode.GTIN);
    Directory.CreateDirectory(path);

    for (int i = 0; i < barcode.No; i++)
    {
        var data = $"{(char)29}01{barcode.GTIN}10{barcode.BATCH}{(char)29}17{barcode.EXP}21{barcode.SN}";
        var matrix = writer.Encode(data);

        var svg = svgRenderer.Render(matrix, BarcodeFormat.DATA_MATRIX, string.Empty);
        File.WriteAllText(Path.Combine(path, $"barcode{i}.svg"), svg.Content);

        var png = pixelRenderer.Render(matrix, BarcodeFormat.DATA_MATRIX, string.Empty);
        using var image = Image.LoadPixelData<Bgra32>(png.Pixels, png.Width, png.Height);
        image.SaveAsPng(Path.Combine(path, $"barcode{i}.png"));
    }
}

Console.WriteLine("Finished!");

class BarcodeData()
{
    public int No { get; set; }
    public required string GTIN { get; set; }
    public required string BATCH { get; set; }
    public string EXP  { get => "250320"; }
    public string SN  { get => Nanoid.Generate(Nanoid.Alphabets.LettersAndDigits, 10); }
}
