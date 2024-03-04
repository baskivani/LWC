import { LightningElement } from 'lwc';

export default class A03ConditionalRendering extends LightningElement {


    sart1 = true

    sart2 = false

//Conditional Rendering Tezahurat

    flag = true

    handleClick(){

     this.flag = !this.flag

    }

// Parola Sorgula

 flag2 = false
inputParola=''
 parola = 'Elma'
    handleChange(event){

// inputtan aldigim deger   eger  gercekparola ile ayni ise 
// parola true olsun

this.inputParola = event.target.value

if(this.parola == this.inputParola ){
 
    this.flag2 = true;
    
}else{
    this.flag2 = false;  
}




    }

//Conditional Rendering YENI 

durum1 = false
durum2 = false
durum3 = false





}

/*

if(  sart 1 ){
    bunu yap
} else if( sart 2) {

} else {

}
*/