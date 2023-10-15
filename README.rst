Scan to task script
-------------------

Simple script for personal use, that scans a A6 page of tasks, crops it, does OCR on it and adds them as `Taskwarrior <https://taskwarrior.org>`_ tasks.

Expects the list to be of the form

::

  1. Task one description
  2. Task two goes over
  multiple lines
  3. Another task

Strings can contain anything which is recognized by taskwarrior (i.e. +tag adds a tag and so on).

The script just takes whatever scanner is seen by scanimage. You can modify your resolution, page size and cropping options according to your needs (by default 150 pixels are cropped from either side where I punch holes in the paper).

Required command line tools
...........................

* Taskwarrior
* sane
* ImageMagick
* tesseract
* awk (maybe the GNU variant, not sure)
* bash
