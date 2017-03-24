pragma(startaddress,efi_main);

extern(C) __gshared void* _D10TypeInfo_i6__initZ;
extern(C) __gshared void* _D15TypeInfo_Struct6__vtblZ;
extern(C) __gshared void* _D10TypeInfo_l6__initZ;
extern(C) __gshared void* _D14TypeInfo_Const6__vtblZ;
extern(C) __gshared void* _D12TypeInfo_Aya6__initZ;
// funcに渡されるメモリアドレス
// （スタックで確保していればスタックのもの、ヒープならヒープのものが渡される）
// がnullのときに呼ばれる。今回、「Struct」はスタックに確保しているので
// スタックのアドレスが渡されて、それは常にnullになりえないのでぶっちゃけ中身はなんでもいい。
extern(C) void _d_assert_msg(){
	sys_halt();
}

struct Struct{
	int a,b;
	string s;
	void func(string s){
		a=0;
		this.s=s;
		return;
	}
}

void sys_halt(){
	while(true){
		asm{
			cli;
			hlt;
		}
	}
}

extern(C) int efi_main(){
	scope(exit){sys_halt();}
	Struct s={0};
	s.a=0xdeadbeef;
	s.b=0xcafecafe;
	s.func("hello world");
	return 0;
}
