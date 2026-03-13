param(
  [Parameter(Mandatory=$true)][string]$Url,
  [string]$OutFile = "memory-qr.png"
)

$ErrorActionPreference = "Stop"

Write-Host "Generating QR for: $Url"
Write-Host "Output file: $OutFile"

try {
  python -V | Out-Null
} catch {
  throw "Python is not available. Install Python OR use an online QR generator, then save as PNG."
}

python -m pip install --upgrade pip | Out-Null
python -m pip install "qrcode[pil]" | Out-Null

$py = @'
import sys
import qrcode
from qrcode.constants import ERROR_CORRECT_H

url = sys.argv[1]
out_file = sys.argv[2]

qr = qrcode.QRCode(error_correction=ERROR_CORRECT_H, box_size=20, border=4)
qr.add_data(url)
qr.make(fit=True)

img = qr.make_image(fill_color="black", back_color="white")
img.save(out_file)
print(out_file)
'@

python -c $py $Url $OutFile | Out-Null

Write-Host "Done."

