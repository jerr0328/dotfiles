# Defined in - @ line 1
function brewupclean --description 'alias brewupclean brew upgrade; and brew cleanup'
	brew upgrade; and brew cleanup $argv;
end
