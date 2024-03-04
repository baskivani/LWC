import { LightningElement } from 'lwc';

export default class A04listRendering extends LightningElement {


sehirler = ['Istanbul' ,'Ankara' ,'Kayseri' ,'Sivas','Artvin']


cicekListesi = [

    {
    id:1,
    name:'Gul',
    familya:'DikenliGuller',
    imgUrl:'https://www.nolinacicek.com/yuklemeler/cicek/img_9907.jpeg'
    } ,
    {
    id:2,
     name:'Lale',
     familya:'Lalegiller',
    imgUrl:'https://www.nolinacicek.com/yuklemeler/cicek/pembe-gul-yesil-vazo_1.jpg'
    },
    {
    id:3,
     name:'Zambak',
     familya:'Zambakgiller',
     imgUrl:'https://www.nolinacicek.com/yuklemeler/cicek/img_9906.jpeg'
    },
    {
     id:4,
     familya:'Soganligiller',
     name:'Sumbul',
     imgUrl:'https://www.nolinacicek.com/yuklemeler/cicek/buket-11.jpg'
    }
    ]



}

/*
for(string str : strList){
    System.debug(str);
}
*/