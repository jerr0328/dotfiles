# Defined in - @ line 1
function brewupclean --description 'alias brewupclean brew update; and brew upgrade; and brew cleanup'
	brew update; and brew upgrade; and brew cleanup $argv;
end
