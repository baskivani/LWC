import { LightningElement } from 'lwc';

export default class A02DataBinding extends LightningElement {     

// tek yonlu data binding
isim = 'MAHMUT' ; 

kisi = {
   ismi:'Hasan',
   yas: '50',
   oyunlar:['tavla','okey','satranc']
}


// cift yonlu data binding


ad='adim buraya yazilacak'

handleChange(event){

   this.ad = event.target.value
}

// data manuple


ilkIsim='degisecek'

handleIlkIsim(event){

   this.ilkIsim = (event.target.value).toUpperCase()
}

// get yontemi ( get ile set kardesdir birlilte olurlar)


ilkIsimGet='degisecek'

handleIlkIsimGet(event){

   this.ilkIsimGet = event.target.value
}

soyisim =''
handleSoyadGet(e){
  this.soyisim  =      (e.target.value).toUpperCase()

}


container
get getIlkIsim(){

   this.container = this.ilkIsimGet
  
   this.container =this.container.toLowerCase();

   this.container = this.container.charAt(0).toUpperCase() +  this.container.slice(1) + ' ' + this.soyisim


   return this.container
}



   }