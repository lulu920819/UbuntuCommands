# python code

convert m4a to wav

	from pydub import AudioSegment

	a = AudioSegment.from_file(file='1220record_yang.m4a',format='m4a')
	print a.duration_seconds

	a.export(out_f='1220.wav',format='wav')