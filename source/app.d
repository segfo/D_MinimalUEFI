import std.stdio;

pragma(startaddress,efi_main);

extern(C) int efi_main(){
	while(true){
		asm{
			cli;
			hlt;
		}
	}
	return 0;
}
