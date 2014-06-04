import sys

#####################
# Author: Bajibabu B
#####################

def main(text_file,prompt_file,prefix_name):
	count=1
	with open(text_file,'r') as f_in, open(prompt_file, 'w') as f_out:
		for line in f_in.readlines():
			new_line='( ' + prefix_name + '_' + str(count) \
				  + ' '  + '"' + line.rstrip() + '" )'
			f_out.writelines(new_line + '\n')
			count+=1

if __name__ =="__main__":
	if len(sys.argv) == 3:
		text_file=sys.argv[1] #text file as first input
		prompt_file=sys.argv[2] #ouput prompt file as second input
		prefix_name='test' #if no third output then test will be default
	elif len(sys.argv) == 4:
		text_file=sys.argv[1]
		prompt_file=sys.argv[2]
		prefix_name=sys.argv[3] 
	else:
		print "Usage: python text2prompt.py <text_file> <prompt_file>"
		sys.exit(2)
	
	main(text_file,prompt_file,prefix_name)


