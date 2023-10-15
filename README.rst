Scan to task script
-------------------

Simple script for personal use, that scans a A6 page of tasks, crops it, does OCR on it and adds them as taskwarrior task.

Expects the list to be of the form

::

  1. Task one description
  2. Task two goes over
  multiple lines
  3. Another task

Modify to your scanner name, resolution, page size according to your needs.

Required command line tools
...........................

* sane
* ImageMagick
* tesseract
* awk (maybe the GNU variant, not sure)
* bash
