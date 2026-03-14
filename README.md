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

---

## Making it last decades

No single website is guaranteed to exist in 10 or 20 years. The best way to keep this memory for Nathan is **multiple copies in different places**.

### 1. Internet Archive (permanent backup)
- Go to **archive.org** and sign in (free account).
- Your item is: **archive.org/details/video_20260313**
- **Whenever you add or change content** (new story, new revelations, new media), upload the full folder again to that item (or create a new item, e.g. `nathan-memory-2027`) so the latest version is preserved.
- The Archive is built for long-term preservation. Keep the item ID written down somewhere Nathan can find it (e.g. with the framed photo or in a family document).

### 2. GitHub (current live site)
- The site runs at **https://kutumelap.github.io/nathan-memory/**
- Keep the repo; if GitHub or Pages ever change, you still have the files in the repo and can re-upload them elsewhere.

### 3. Your own backups (at least two places)
- **ZIP the whole folder** (index.html, who-he-is.html, poster.jpg, audio, video, all assets).
- Save the ZIP in at least two places, e.g.:
  - A cloud folder (Google Drive, OneDrive, iCloud, etc.)
  - An external hard drive or USB stick kept with important papers
- **Refresh the ZIP whenever you update the site** so the backup is current.
- Tell one other family member where these backups are so they’re not lost.

### 4. Optional: print or PDF
- Print the main page and the letter page (after entering the password) and keep them in a folder with other important family documents.
- Or save as PDF from the browser (Print → Save as PDF) and store the PDFs in the same backup places.

### What to tell Nathan
- “If the link on the QR ever stops working, search the Internet Archive for **video_20260313** (or the item ID we gave you). We also keep a backup at [wherever you store it].”
- The footer on the main page already points him to the Archive; you can add a handwritten note near the frame with the Archive item ID and the password for the letter.

---

## Letter page (who-he-is.html)

The "A letter for you" page is **password-protected** and the letter content is **encrypted** in the page. Viewing the HTML source or downloading the file does not show the real letter—only after entering the correct password (150793) does the browser decrypt and show it. So even if someone technical opens the file, they see encrypted data, not the message.

### When you want to update the letter
1. Edit **encrypt-content.js**: replace the `content` string with your new letter HTML (same structure: back link, "Who you are", blocks, "Words over your future", archive note).
2. Run: `node encrypt-content.js`
3. Copy the printed base64 string.
4. In **who-he-is.html**, find the `<script id="payload" type="text/plain">` tag and replace the long string inside it with the new base64 string.
5. Save and push to GitHub (and re-upload to Archive.org if you use that backup).
