# Population genetics of X and Y chromosomes in _Rumex hastatulus_

This repository stores various snippets of code, figures, data links, and other useful information relevant to our project investigating X and Y chromosome evolution and diversity in  _Rumex hastatulus_

## Data access

Here are some links

- bam files
- reference transcriptome
- reference genome
- gatk ouputs
- polymorphurama
- mlhka
- manuscript
  - [figure1](https://github.com/houghjosh/XYdiversity/blob/master/example-figure.png)
  - figure2



+ [Issue Reporting Guide](https://github.com/mozilla/pdf.js/blob/master/.github/CONTRIBUTING.md)
+ [Code Contribution Guide](https://github.com/mozilla/pdf.js/wiki/Contributing)
+ [Frequently Asked Questions](https://github.com/mozilla/pdf.js/wiki/Frequently-Asked-Questions)
+ [Good Beginner Bugs](https://github.com/mozilla/pdf.js/issues?direction=desc&labels=5-good-beginner-bug&page=1&sort=created&state=open)
+ [Priorities](https://github.com/mozilla/pdf.js/milestones)
+ [Attend a Public Meeting](https://github.com/mozilla/pdf.js/wiki/Weekly-Public-Meetings)

For further questions or guidance feel free to stop by #pdfjs on
irc.mozilla.org.

## Getting Started

### Online demo

+ http://mozilla.github.io/pdf.js/web/viewer.html

### Browser Extensions

#### Firefox (and Seamonkey)

PDF.js is built into version 19+ of Firefox, however one extension is still available:

+ [Development Version](http://mozilla.github.io/pdf.js/extensions/firefox/pdf.js.xpi) - This extension is mainly intended for developers/testers, and it is updated every time new code is merged into the PDF.js codebase. It should be quite stable, but might break from time to time.

  + Please note that the extension is *not* guaranteed to be compatible with Firefox versions that are *older* than the current ESR version, see the [Release Calendar](https://wiki.mozilla.org/RapidRelease/Calendar#Past_branch_dates).

  + The extension should also work in Seamonkey, provided that it is based on a Firefox version as above (see [Which version of Firefox does SeaMonkey 2.x correspond with?](https://wiki.mozilla.org/SeaMonkey/FAQ#General)), but we do *not* guarantee compatibility.

#### Chrome

+ The official extension for Chrome can be installed from the [Chrome Web Store](https://chrome.google.com/webstore/detail/pdf-viewer/oemmndcbldboiebfnladdacbdfmadadm).
*This extension is maintained by [@Rob--W](https://github.com/Rob--W).*
+ Build Your Own - Get the code as explained below and issue `gulp chromium`. Then open
Chrome, go to `Tools > Extension` and load the (unpackaged) extension from the
directory `build/chromium`.

## Getting the Code

To get a local copy of the current code, clone it using git:

    $ git clone git://github.com/mozilla/pdf.js.git
    $ cd pdf.js

Next, install Node.js via the [official package](http://nodejs.org) or via
[nvm](https://github.com/creationix/nvm). You need to install the gulp package
globally (see also [gulp's getting started](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md#getting-started)):

    $ npm install -g gulp-cli

If everything worked out, install all dependencies for PDF.js:

    $ npm install

Finally you need to start a local web server as some browsers do not allow opening
PDF files using a file:// URL. Run

    $ gulp server

and then you can open

+ http://localhost:8888/web/viewer.html

It is also possible to view all test PDF files on the right side by opening

+ http://localhost:8888/test/pdfs/?frame

## Building PDF.js

In order to bundle all `src/` files into two productions scripts and build the generic
viewer, issue:

    $ gulp generic

This will generate `pdf.js` and `pdf.worker.js` in the `build/generic/build/` directory.
Both scripts are needed but only `pdf.js` needs to be included since `pdf.worker.js` will
be loaded by `pdf.js`. If you want to support more browsers than Firefox you'll also need
to include `compatibility.js` from `build/generic/web/`. The PDF.js files are large and
should be minified for production.
