
# Ini untuk simulasi proses loading di backEnd. ada delay 2 detik.

late bool _isLoading;
@override
void initState(){
    _isLoading = true;
    Future.delayed(const Duration(secons:2), (){
        setState((){
            _isLoading= false;
        });
    });
    super.initState();
}


/**
Letakkan script ini dihalaman yang akan ditampilkan:

 * Untuk menampilkan ini banyak, bisa menggunakan ListView.separated()
 * Contoh bisa di copypaste
 * ListView.separated(
 *  itemCount:5,
 *  itemBuilder:(context, index)=>const NewsCardSkelton(),
 *  separatorBuilder:(content, index)=>
 *    const SizedBox(height:16);
 * );
 * 
 */

 