#!/usr/bin/env python
import glob
import os.path
import re
import subprocess
import sys

PYPI='http://pypi.ccnmtl.columbia.edu/'

def get_package(name, version):
    """
    Download a pypi package
    """
    attempts = [
        '%s-%s-py2.py3-none-any.whl' % (name, version),
        '%s-%s-py2-none-any.whl' % (name, version),
        '%s-%s-py27-none-any.whl' % (name, version),
        '%s-%s.tar.gz' % (name, version),
        '%s-%s.tgz' % (name, version)
    ]
    for attempt in attempts:
        if os.path.isfile(attempt):
            return

    urls = [PYPI + name + '/' + version + '/' + x for x in attempts]
    for url in urls:
        print 'Downloading ' + url
        subprocess.call(['curl', '-O', url])

def clean_dir(directory):
    """
    Remove html 404 files from dir
    """
    files = glob.glob('*.whl') + glob.glob('*.tar.gz')
    file_count = 0
    deleted_count = 0
    for fname in files:
        file_count += 1
        out = subprocess.check_output(['file', fname])
        if re.search(r'HTML document text', out):
            deleted_count += 1
            print 'Deleting ' + fname
            subprocess.call(['rm', fname])

def main():
    if len(sys.argv) <= 1 or sys.argv[1] == '-h':
        execname = os.path.basename(sys.argv[0])
        print "usage: %s fetch requirements.txt" % execname
        print "       %s clean" % execname
        sys.exit(1)

    if sys.argv[1] == 'fetch':
        with open(sys.argv[2], 'r') as f:
            for line in f:
                matches = re.match(r'^([\w-]*)==([\d\.\w]*)$', line)
                if len(matches.groups()) == 2:
                    package_name = matches.group(1)
                    package_version = matches.group(2)
                    get_package(package_name, package_version)
    elif sys.argv[1] == 'clean':
        clean_dir('.')

    print 'done!'

if __name__ == '__main__':
    main()
