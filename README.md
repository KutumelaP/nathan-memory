# QR Memory Brain (separate mini-site)

This folder is **standalone**. It won’t affect the rest of your app.

## What this is
- A beautiful memorial page (`index.html`) that loads all content from `config.json`
- A private-by-default **Memory Wall** (notes save on each visitor’s device)
- A timeline + gallery + optional audio

## Customize (the only file you edit)
Open `config.json` and change:
- `pageTitle`, `headline`, `intro`
- `timeline` items
- `gallery` items
- `audio.enabled` to `true` if you upload `assets/audio.mp3`

## Add your images
Put your files in `assets/` and name them exactly:
- `framed-photo.jpg` (your framed drawing/photo)
- `message-poster.jpg` (your “always in spirit” poster)

Optional gallery images:
- `gallery-1.jpg`, `gallery-2.jpg`, etc (or update names in `config.json`)

## Test locally (Windows)
Browsers often block loading `config.json` if you open the HTML as a file.
Use a tiny local server:

### Option A (Python)
```powershell
cd C:\food_marketplace_app\web_solutions\qr-memory-brain
python -m http.server 8080
```
Then open `http://localhost:8080/`.

### Option B (Node)
```powershell
cd C:\food_marketplace_app\web_solutions\qr-memory-brain
npx --yes http-server -p 8080
```
Then open `http://localhost:8080/`.

## Upload to Archive.org (for your QR target)
Upload everything inside this folder to your Archive item:
- `index.html`
- `config.json`
- `assets/*`

Then your QR should point to the Archive page URL (or the direct file URL if you prefer).

## QR code (best print settings)
Use **high error correction** (H) and print size \(\ge 4–5 cm\) wide.

### Generate a QR PNG (optional)
If you have Python installed:
```powershell
cd C:\food_marketplace_app\web_solutions\qr-memory-brain
.\make-qr.ps1 -Url "https://archive.org/details/YOUR_ITEM_ID" -OutFile "memory-qr.png"
```

