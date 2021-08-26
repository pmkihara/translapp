import $ from 'jquery';
import 'select2';

const select2 = () => {
  // const cities = ["Amsterdam","Bali","Barcelona","Belo Horizonte","Berlin","Bordeaux","Brussels","Buenos Aires","Casablanca","Chengdu","Copenhagen","Kyoto","Lausanne","Lille","Lisbon","London","Lyon","Madrid","Marseille","Melbourne","Mexico","Milan","Montréal","Nantes","Oslo","Paris","Rio de Janeiro","Rennes","Rome","São Paulo","Seoul","Shanghai","Shenzhen","Singapore","Stockholm","Tel Aviv","Tokyo"];
  // const languages = ['Abkhazian','Afar','Afrikaans','Akan','Albanian','Amharic','Arabic','Aragonese','Armenian','Assamese','Avaric','Avestan','Aymara','Azerbaijani','Bambara','Bashkir','Basque','Belarusian','Bengali','Bislama','Bosnian','Breton' ,'Bulgarian','Burmese','Catalan', 'Valencian','Central Khmer','Chamorro','Chechen','Chichewa','Chinese','Chuvash','Cornish','Corsican','Cree','Croatian','Czech','Danish','Divehi', 'Dhivehi', 'Maldivian','Dutch','Dzongkha','English','Esperanto','Estonian','Ewe','Faroese','Fijian','Finnish','French','Fulah','Gaelic','Galician','Ganda','Georgian','German', 'Gikuyu','Greek','Greenlandic','Guarani','Gujarati','Haitian','Hausa','Hebrew','Herero','Hindi','Hiri Motu','Hungarian','Icelandic','Ido','Igbo','Indonesian','Interlingua','Interlingue','Inuktitut','Inupiaq','Irish','Italian','Japanese','Javanese','Kannada','Kanuri','Kashmiri','Kazakh','Kinyarwanda','Komi','Kongo','Korean','Kwanyama', 'Kuanyama','Kurdish','Kyrgyz','Lao','Latin','Latvian','Luxembourgish','Limburgish','Lingala','Lithuanian','Luba-Katanga','Macedonian','Malagasy','Malay','Malayalam','Maltese','Manx','Marathi','Marshallese','Moldovan', 'Moldavian', 'Romanian','Mongolian','Nauru','Navajo', 'Navaho','Northern Ndebele','Ndonga','Nepali','Northern Sami','Norwegian','Nuosu', 'Sichuan Yi','Occitan','Ojibwa','Oriya','Oromo','Ossetian', 'Ossetic','Pali','Panjabi', 'Punjabi','Pashto', 'Pushto','Persian','Polish','Portuguese','Quechua','Romansh','Rundi','Russian','Samoan','Sango','Sanskrit','Sardinian','Serbian','Shona','Sindhi','Sinhala', 'Sinhalese','Slovak','Slovenian','Somali','Sotho','South Ndebele','Spanish','Sundanese','Swahili','Swati','Swedish','Tagalog','Tahitian','Tajik','Tamil','Tatar','Telugu','Thai','Tibetan','Tigrinya','Tonga','Tsonga','Tswana','Turkish','Turkmen','Twi','Uighur', 'Uyghur','Ukrainian','Urdu','Uzbek','Venda','Vietse','Volap_k','Walloon','Welsh','Western Frisian', 'Wolof','Xhosa','Yiddish','Yoruba','Zhuang', 'Chuang','Zulu'];

  $('.city-input').select2({ width: '100%' });
  $('.language-input').select2({ width: '100%' });
=======

  $('.city-input').select2();
}

export { select2 }
