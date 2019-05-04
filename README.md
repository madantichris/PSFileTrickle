# PSFileTrickle
A Powershell script to trickle copy files from one directory to another.

The goal of this script was to provide a way to bulk copy large amounts of files from one directory to another in smaller chunks because Windows sometimes gets wiggy when you try to copy 5000+ files at once into a folder.

There are a couple parameters you can set to fine tune the processing based on your computer and/or network speed:
* $source_dir - The folder where the files are being copied from.  This can be a local path or UNC.
* $dest_dir - The folder where the files are being copied to.  This can be a local path or UNC.
* $backlog_count - The max number of files you want to have sitting in $dest_dir waiting for processing.  When there are this number (or greater) files in $dest_dir, the script will sleep until they have been processed or removed.
* $delay_seconds - The time in seconds to sleep in between attempts to copy.

For more verbose logging, you may uncomment the line setting $DebugPreference="Continue"


This script originates and is maintained at: https://github.com/madantichris/PSFileTrickle

MIT License

Copyright (c) 2019 Chris Emery

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
