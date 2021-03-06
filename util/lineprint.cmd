@setlocal enableextensions & python -x "%~f0" %* & goto :EOF


import sys


def usage(prog):
    # print "%s <inputfile> <pattern> [|Reverse|Nosort]" % prog
    print "%s <pattern> [Reverse]" % prog


def win32_unicode_argv():
    """Uses shell32.GetCommandLineArgvW to get sys.argv as a list of Unicode
    strings.

    Versions 2.x of Python don't support Unicode in sys.argv on
    Windows, with the underlying Windows API instead replacing multi-byte
    characters with '?'.
    """

    from ctypes import POINTER, byref, cdll, c_int, windll
    from ctypes.wintypes import LPCWSTR, LPWSTR

    GetCommandLineW = cdll.kernel32.GetCommandLineW
    GetCommandLineW.argtypes = []
    GetCommandLineW.restype = LPCWSTR

    CommandLineToArgvW = windll.shell32.CommandLineToArgvW
    CommandLineToArgvW.argtypes = [LPCWSTR, POINTER(c_int)]
    CommandLineToArgvW.restype = POINTER(LPWSTR)

    cmd = GetCommandLineW()
    argc = c_int(0)
    argv = CommandLineToArgvW(cmd, byref(argc))
    if argc.value > 0:
        # Remove Python executable and commands if present
        start = argc.value - len(sys.argv)
        return [argv[i] for i in
                xrange(start, argc.value)]


def lineprint(file,count):
	i=0
	history=[]
	for line in file:
		line=line.strip()
		if line not in history:
			history.append(line)
			if i>=count: return
			i=i+1
			# print "line",i,">=",count,i>=count,":",line,
			print line


def main():
	sys.argv = win32_unicode_argv()
	if len(sys.argv) < 1:
		usage(sys.argv[0])
		return
	
	count = 1000
	try: count=int(sys.argv[1])
	except: pass
	
	f=sys.stdin
	lineprint(f,count)
	
	
	# print len(sys.argv)
	# print sys.argv
	# raw_input()


if __name__ == '__main__':
	import traceback
	import time
	
	try: 	
		main()
	except:
		traceback.print_exc()
		warning("Press Ctrl-C to Continue...")
		while True:  time.sleep(1)
