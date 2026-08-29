<p align="center">
  <img src="_Dev/CoreCreator_Header.png" />
</p>

This is a live development repository - <a target="_blank" href="https://www.curseforge.com/hytale/mods/hr-core-creator/files/all"> releases are available on CurseForge</a>.

<h1>Documentation</h1>

* This is a Modpack, not a Plugin. This may change in the future.
* [Changelog](_Dev/Changelog.md) (may include upcoming release changes).
* [Changelog Development](_Dev/Changelog_Development.md) Includes future content (IDs references mostly). Take this as reference rather than a release roadmap.
* Game target version is shown on CurseForge.
* Optional dependencies: <a target="_blank" href="https://www.curseforge.com/hytale/mods/hr-windmills">HR Windmills</a>, <a target="_blank" href="https://www.curseforge.com/hytale/mods/hr-core-prefabs">HR Core Prefabs</a>.
* Supported languages: English, Spanish.

### Experimental content

Items using 'Experimental' quality are unstable, may not work properly and are subject to change or being removed. Do not use them on public servers or finished projects.

### Compression

Goal is to maximize optimization using the smallest filesize without direct loss of quality for servers and clients to load the included asset resources on the most efficient way possible. Stable releases after v.1.0 will be built using a sanitizer and compression process for textures and audio files. 'Alpha' and 'Beta' releases won't meet this process so expect for these to have a bigger filesize.

* [BAT file](_Dev/Compressor.bat)
* pngquant.exe > https://github.com/kornelski/pngquant
* oxipng.exe > https://github.com/oxipng/oxipng
* ffmpeg.exe > https://ffmpeg.org

Steps:

* Create a new folder and put the 3 EXE and BAT file inside.
* Make a copy of your mod folder and paste it inside the new folder.
* Run The BAT file and wait until the process is complete.
* You can now compress your mod as ZIP file.

### Use of AI

Most of these assets contain hand-drawn and composed textures. However, a very limited number of designs may include AI-generated content to speed up creation process. The use of AI tools on this work is not intended to replace any human work but help in creation process for some assets since I'm just one dev behind all of this. I plan to hire artists in the future to replace current AI designs.

Assets using AI-generated content: `Decal_Graffiti2x2_Urban`, `Decal_Graffiti3x2_Urban`, `Decal_Graffiti3x3_Urban`.

<hr>

<h1>Terms of use</h1>

Hytale copyright policy and terms of service applies: https://hytale.com/terms-of-service

General:
<ul>
  <li>$\color{Lime}\textsf{No credit required.}$</li>
  <li>$\color{#ff4d4d}\textsf{Do not distribute it.}$</li>
</ul>

Server owners / shared worlds:
<ul>
  <li>$\color{Lime}\textsf{This mod can be used on public servers and shared worlds.}$</li>
  <li>$\color{Yellow}\textsf{Modifications are allowed as long it is on a closed environment inside your server or world.}$</li>
  <li>$\color{#ff4d4d}\textsf{Distribution for profit is not allowed, including in-game purchases and lootboxes using real money.}$</li>
</ul>

<hr>

<h1>Copyright</h1>
<ul>
  <li>Original assets made by heavenly-roads.</li>
  <li>Hytale game, vanilla assets and source belongs to Hypixel Studios Canada inc.</li>
  <li>Some textures includes historical paintings under the public domain license.</li>
</ul>
