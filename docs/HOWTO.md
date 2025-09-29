# How to ...

<details>
<summary>... remove any EXIF data from images in the repo</summary>

Run `make strip-exif` to remove.
</details>

<details>
<summary>... check that an image does not contain any EXIF data</summary>

```
$ exif --no-fixup assets/images/logo.png
Corrupt data
The data provided does not follow the specification.
ExifLoader: The data supplied does not seem to contain EXIF data.
```
</details>

<details>
<summary>... to create an animated GIF out of (3) PNGs</summary>

Here’s how you can turn your 3 PNGs into a smooth, transparent animated GIF in GIMP:

1️⃣ Open your PNGs as layers

1. Launch GIMP.

2. Go to File → Open as Layers…

3. Select the three PNGs ([frame1.png](../assets/animate/frame1.png), [frame2.png](../assets/animate/frame2.png), [frame3.png](../assets/animate/frame3.png)).
→ They will appear stacked in the Layers panel.

2️⃣ Arrange the frames

- Make sure the layers are in the right order (bottom = first frame).

- Rename them to include timing, e.g.:

   ```
    frame-1 (200ms)
    frame-2 (200ms)
    frame-3 (200ms)
   ```

(The text in parentheses sets the duration per frame in GIMP’s GIF exporter.)

3️⃣ Export as GIF

1. Go to File → Export As…

2. Choose a name, e.g. [icon.gif](../assets/animate/icon.gif).

3. In the export dialog:

   - Check As animation.

   - Enable Loop forever (if you want it to repeat).

   - Set Delay between frames (e.g. 200 ms if you didn’t add timing in layer names).

   - Set Frame disposal to One frame per layer (replace) or Combine (try both; “Replace” often works best for transparency).

4️⃣ (Optional) Improve color quality

GIF is limited to 256 colors, so you may want to:

1. Go to Image → Mode → Indexed…

2. Choose Generate optimum palette with 256 colors and enable Dithering (Floyd–Steinberg).

3. Then export again.

5️⃣ Preview

Open the exported GIF in any browser or image viewer to check the flicker.

💡 Tip: If the GIF still looks grainy, consider exporting as WebP animation instead (File → Export As → `.webp`) — it supports full color and transparency.
</details>