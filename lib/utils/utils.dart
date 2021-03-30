import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JsonVolumeOfDeliveries {
  static String volumeJson = '''
  [
    {
        "id": 1,
        "region_id": "1",
        "company_id": "1",
        "name": "ТОО «АДМ ГАЗ»",
        "comment": "Жубр аумағында",
        "is_open": "0",
        "coord_x": "43.697428",
        "coord_y": " 51.185041",
        "created_at": "2021-03-26T10:26:12.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "5"
    },
    {
        "id": 2,
        "region_id": "1",
        "company_id": "1",
        "name": "ТОО «АДМ ГАЗ»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.669993",
        "coord_y": " 51.241357",
        "created_at": "2021-03-26T10:26:16.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "5"
    },
    {
        "id": 3,
        "region_id": "1",
        "company_id": "1",
        "name": "ТОО «АДМ ГАЗ»",
        "comment": "Актау Лада аумағында",
        "is_open": "1",
        "coord_x": "43.634985",
        "coord_y": " 51.227379",
        "created_at": "2021-03-26T13:44:51.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "5"
    },
    {
        "id": 4,
        "region_id": "1",
        "company_id": "1",
        "name": "ТОО «АДМ ГАЗ»",
        "comment": "Басқұдыққа кіре-берісте, Анварға қарама қарсы бетте",
        "is_open": "0",
        "coord_x": "43.685629",
        "coord_y": " 51.197020",
        "created_at": "2021-03-26T10:26:21.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "5"
    },
    {
        "id": 5,
        "region_id": "1",
        "company_id": "1",
        "name": "ТОО «АДМ ГАЗ»",
        "comment": "31Б шағын аудан, KIKOM бензин заправкасында",
        "is_open": "0",
        "coord_x": "43.687180",
        "coord_y": " 51.183639",
        "created_at": "2021-03-26T10:26:24.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "5"
    },
    {
        "id": 6,
        "region_id": "1",
        "company_id": "2",
        "name": "ТОО «TanaGasCom»",
        "comment": "Гелиус бензин заправкасында орналасқан,  29а ша",
        "is_open": "0",
        "coord_x": "43.666428",
        "coord_y": " 51.173530",
        "created_at": "2021-03-26T10:26:39.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "2"
    },
    {
        "id": 7,
        "region_id": "1",
        "company_id": "2",
        "name": "ТОО «TanaGasCom»",
        "comment": "Гелиус 24 ша",
        "is_open": "1",
        "coord_x": "43.655584",
        "coord_y": " 51.171446",
        "created_at": "2021-03-26T13:44:45.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "2"
    },
    {
        "id": 8,
        "region_id": "1",
        "company_id": "2",
        "name": "ТОО «TanaGasCom»",
        "comment": "29А ша Бақ сарай рестораны қасында",
        "is_open": "0",
        "coord_x": "43.663812",
        "coord_y": " 51.186838",
        "created_at": "2021-03-26T10:26:44.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "2"
    },
    {
        "id": 9,
        "region_id": "1",
        "company_id": "2",
        "name": "ТОО «TanaGasCom»",
        "comment": "Мабер жанында",
        "is_open": "0",
        "coord_x": "43.644088",
        "coord_y": " 51.177337",
        "created_at": "2021-03-26T10:26:48.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "2"
    },
    {
        "id": 10,
        "region_id": "1",
        "company_id": "2",
        "name": "ТОО «TanaGasCom»",
        "comment": "Рикон тұрғын-үй массивіне қарама-қарсы",
        "is_open": "0",
        "coord_x": "43.654028",
        "coord_y": " 51.239129",
        "created_at": "2021-03-26T10:26:50.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "2"
    },
    {
        "id": 11,
        "region_id": "1",
        "company_id": "2",
        "name": "ТОО «TanaGasCom»",
        "comment": "25 шағын аудан, Қызыл Қала жол бойында",
        "is_open": "1",
        "coord_x": "43.654414",
        "coord_y": " 51.181675",
        "created_at": "2021-03-26T13:44:38.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "2"
    },
    {
        "id": 12,
        "region_id": "1",
        "company_id": "3",
        "name": "ТОО «АвтоГаз Трейд»",
        "comment": "ЖУБР аумағында",
        "is_open": "0",
        "coord_x": "43.690447",
        "coord_y": " 51.186795",
        "created_at": "2021-03-26T10:27:27.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "4"
    },
    {
        "id": 13,
        "region_id": "1",
        "company_id": "3",
        "name": "ТОО «АвтоГаз Трейд»",
        "comment": "ХГМЗ аумағында",
        "is_open": "1",
        "coord_x": "43.669376",
        "coord_y": " 51.251834",
        "created_at": "2021-03-26T12:14:19.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "4"
    },
    {
        "id": 14,
        "region_id": "1",
        "company_id": "3",
        "name": "ТОО «АвтоГаз Трейд»",
        "comment": "Приморский елді мекенінде",
        "is_open": "0",
        "coord_x": "43.618104",
        "coord_y": " 51.218749",
        "created_at": "2021-03-26T10:27:32.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "4"
    },
    {
        "id": 15,
        "region_id": "1",
        "company_id": "3",
        "name": "ТОО «АвтоГаз Трейд»",
        "comment": "Актау Лада аумағында",
        "is_open": "1",
        "coord_x": "43.637895",
        "coord_y": " 51.219138",
        "created_at": "2021-03-26T12:14:25.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "4"
    },
    {
        "id": 16,
        "region_id": "1",
        "company_id": "3",
        "name": "ТОО «АвтоГаз Трейд»",
        "comment": "Құс фабрикасы аумағында",
        "is_open": "0",
        "coord_x": "43.668020",
        "coord_y": " 51.194316",
        "created_at": "2021-03-26T10:27:39.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "4"
    },
    {
        "id": 17,
        "region_id": "1",
        "company_id": "3",
        "name": "ТОО «АвтоГаз Трейд»",
        "comment": "29 ша., САК базарының артында",
        "is_open": "1",
        "coord_x": "43.660601",
        "coord_y": " 51.182182",
        "created_at": "2021-03-26T12:14:35.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "4"
    },
    {
        "id": 18,
        "region_id": "1",
        "company_id": "4",
        "name": "ТОО «Газ Центр»",
        "comment": "Басқұдық кіре-берісте орналасқан,  ТЦ Аминаға қарама-қарсы",
        "is_open": "0",
        "coord_x": "43.686355",
        "coord_y": " 51.197480",
        "created_at": "2021-03-26T10:27:50.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "6"
    },
    {
        "id": 19,
        "region_id": "1",
        "company_id": "4",
        "name": "ТОО «Газ Центр»",
        "comment": "29а шағын аудан",
        "is_open": "0",
        "coord_x": "43.664992",
        "coord_y": " 51.173862",
        "created_at": "2021-03-26T10:28:07.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "6"
    },
    {
        "id": 20,
        "region_id": "1",
        "company_id": "5",
        "name": "ТОО «CaspiGaz»",
        "comment": "19 мкр",
        "is_open": "0",
        "coord_x": "43.674508",
        "coord_y": " 51.157483",
        "created_at": "2021-03-26T10:28:22.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 21,
        "region_id": "1",
        "company_id": "6",
        "name": "ИП «Сұлтан»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.643108",
        "coord_y": " 51.205507",
        "created_at": "2021-03-26T10:28:33.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 22,
        "region_id": "1",
        "company_id": "7",
        "name": "ИП «Алиаскар»",
        "comment": "Приозерный елді мекені «Мағаш» заводы жанында",
        "is_open": "1",
        "coord_x": "43.670039",
        "coord_y": " 51.245690",
        "created_at": "2021-03-26T13:44:57.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 23,
        "region_id": "1",
        "company_id": "8",
        "name": "ИП «Авраменко Г»",
        "comment": "Диас Хаким Б/Ц орталығы қасында",
        "is_open": "0",
        "coord_x": "43.641677",
        "coord_y": " 51.179114",
        "created_at": "2021-03-26T10:29:08.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 24,
        "region_id": "1",
        "company_id": "8",
        "name": "ИП «Авраменко Г»",
        "comment": "Диас Хаким Б/Ц орталығы қасында",
        "is_open": "0",
        "coord_x": "43.641220",
        "coord_y": " 51.182333",
        "created_at": "2021-03-26T10:29:11.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 25,
        "region_id": "1",
        "company_id": "9",
        "name": "ИП «Боханова З»",
        "comment": "29А ша",
        "is_open": "0",
        "coord_x": "43.664623",
        "coord_y": " 51.173964",
        "created_at": "2021-03-26T10:29:32.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 26,
        "region_id": "1",
        "company_id": "10",
        "name": "ИП «Бозжигитов М»",
        "comment": "29а ша",
        "is_open": "0",
        "coord_x": "43.663293",
        "coord_y": " 51.186487",
        "created_at": "2021-03-26T10:29:51.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 27,
        "region_id": "1",
        "company_id": "11",
        "name": "ИП «Боханов Б»",
        "comment": "25 ша Асар-С базарына қарама-қарсы",
        "is_open": "0",
        "coord_x": "43.655697",
        "coord_y": " 51.176687",
        "created_at": "2021-03-26T10:30:06.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 28,
        "region_id": "1",
        "company_id": "12",
        "name": "ИП «Боханулы Т»",
        "comment": "29а ша Бақ Сарай рестораны қасында",
        "is_open": "0",
        "coord_x": "43.664141",
        "coord_y": " 51.187865",
        "created_at": "2021-03-26T10:30:20.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 29,
        "region_id": "1",
        "company_id": "13",
        "name": "ТОО «LPG Trade»",
        "comment": "Актау Лада аумағында",
        "is_open": "0",
        "coord_x": "43.633983",
        "coord_y": " 51.229011",
        "created_at": "2021-03-26T10:30:38.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 30,
        "region_id": "1",
        "company_id": "13",
        "name": "ТОО «LPG Trade»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.672428",
        "coord_y": " 51.230596",
        "created_at": "2021-03-26T10:30:41.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 31,
        "region_id": "1",
        "company_id": "14",
        "name": "ИП «Нурсултанов Д»",
        "comment": "29а ша",
        "is_open": "0",
        "coord_x": "43.662318",
        "coord_y": " 51.185169",
        "created_at": "2021-03-26T10:31:01.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 32,
        "region_id": "1",
        "company_id": "15",
        "name": "ИП «АГЗС Алшынбай»",
        "comment": "Шығыс-3 ке қарама қарсы бетте",
        "is_open": "0",
        "coord_x": "43.687724",
        "coord_y": " 51.195570",
        "created_at": "2021-03-26T10:31:28.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 33,
        "region_id": "1",
        "company_id": "16",
        "name": "ТОО «Айби»",
        "comment": "24 шағын аудан, Асар-С базарына қарама-қарсы",
        "is_open": "0",
        "coord_x": "43.656975",
        "coord_y": " 51.173215",
        "created_at": "2021-03-26T10:31:41.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 34,
        "region_id": "1",
        "company_id": "17",
        "name": "ИП «Мендикулов»",
        "comment": "29а шағын аудан",
        "is_open": "0",
        "coord_x": "43.667010",
        "coord_y": " 51.172791",
        "created_at": "2021-03-26T10:31:55.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 35,
        "region_id": "1",
        "company_id": "18",
        "name": "ИП «Матаев»",
        "comment": "Приозерный елді мекені аумағында",
        "is_open": "0",
        "coord_x": "43.643075",
        "coord_y": " 51.202154",
        "created_at": "2021-03-26T10:32:15.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 36,
        "region_id": "1",
        "company_id": "18",
        "name": "ИП «Матаев»",
        "comment": "8А шағын аудан, Рахат сауда үйі маңында",
        "is_open": "0",
        "coord_x": "43.646473",
        "coord_y": " 51.168133",
        "created_at": "2021-03-26T10:33:12.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 37,
        "region_id": "1",
        "company_id": "19",
        "name": "ИП «Курмашев А.У»",
        "comment": "23 ш/а., «Вогончик» кафесі жанында",
        "is_open": "0",
        "coord_x": "43.653122",
        "coord_y": " 51.177281",
        "created_at": "2021-03-26T10:33:20.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 38,
        "region_id": "1",
        "company_id": "20",
        "name": "ИП «Айбазарова»",
        "comment": "3Б ша., базаОРС жолында  ",
        "is_open": "0",
        "coord_x": "43.640914",
        "coord_y": " 51.184533",
        "created_at": "2021-03-26T10:33:58.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 39,
        "region_id": "1",
        "company_id": "21",
        "name": "ИП «АГЗС Jideli»",
        "comment": "25 ша САҚ базарға қарама қарсы бетте",
        "is_open": "0",
        "coord_x": "43.658253",
        "coord_y": " 51.180580",
        "created_at": "2021-03-26T10:34:02.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 40,
        "region_id": "1",
        "company_id": "22",
        "name": "ИП «Көкшеев»",
        "comment": "23 ша",
        "is_open": "0",
        "coord_x": "43.649682",
        "coord_y": " 51.180150",
        "created_at": "2021-03-26T10:34:04.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 41,
        "region_id": "1",
        "company_id": "23",
        "name": "ИП «Кулжанов»",
        "comment": "25 ш/а., «Сақ» базарға қарама-қарсы",
        "is_open": "0",
        "coord_x": "43.658739",
        "coord_y": " 51.181471",
        "created_at": "2021-03-26T10:34:08.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 42,
        "region_id": "1",
        "company_id": "24",
        "name": "ТОО «Асима»",
        "comment": "29а ша, Таңавтар СТОға қарама қарсы",
        "is_open": "0",
        "coord_x": "43.661566",
        "coord_y": " 51.184074",
        "created_at": "2021-03-26T10:34:11.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 43,
        "region_id": "1",
        "company_id": "25",
        "name": "ИП «Избанов»",
        "comment": "29а ша Избанов",
        "is_open": "0",
        "coord_x": "43.665321",
        "coord_y": " 51.190306",
        "created_at": "2021-03-26T10:34:15.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 44,
        "region_id": "1",
        "company_id": "26",
        "name": "ИП «Caspian Gaz»",
        "comment": "24 ш/а «Асар-С» базарына қарсы орналасқан, Гулдана",
        "is_open": "0",
        "coord_x": "43.656073",
        "coord_y": " 51.172257",
        "created_at": "2021-03-26T10:34:20.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 45,
        "region_id": "1",
        "company_id": "26",
        "name": "ИП «Caspian Gaz»",
        "comment": "25 ш/а., «ҚызылҚала» моншасы жанында",
        "is_open": "0",
        "coord_x": "43.655921",
        "coord_y": " 51.179139",
        "created_at": "2021-03-26T10:34:23.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 46,
        "region_id": "1",
        "company_id": "27",
        "name": "ИП «Суюндыкова М»",
        "comment": "Рикон жол бойында",
        "is_open": "0",
        "coord_x": "43.642967",
        "coord_y": " 51.240222",
        "created_at": "2021-03-26T10:34:45.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 47,
        "region_id": "1",
        "company_id": "28",
        "name": "ИП «Сағындық»",
        "comment": "28А ш/а. «Ақ Отау» қарама-қарсы орналасқан",
        "is_open": "0",
        "coord_x": "43.657929",
        "coord_y": " 51.175863",
        "created_at": "2021-03-26T10:34:52.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 48,
        "region_id": "1",
        "company_id": "29",
        "name": "ИП «Сағындықова»",
        "comment": "3Б ша, БазаОРС аумағында",
        "is_open": "0",
        "coord_x": "43.635991",
        "coord_y": " 51.191638",
        "created_at": "2021-03-26T10:35:06.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 49,
        "region_id": "1",
        "company_id": "30",
        "name": "ИП «Бимагамбетов»",
        "comment": "25 ша,. «Таңатар» көлік жөндеу орталығының қасында",
        "is_open": "0",
        "coord_x": "43.659620",
        "coord_y": " 51.184387",
        "created_at": "2021-03-26T10:35:16.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 50,
        "region_id": "1",
        "company_id": "31",
        "name": "ТОО «Шынар ЛТД»",
        "comment": "Шығыс 2 ге қарама қарсы бетте",
        "is_open": "0",
        "coord_x": "43.680434",
        "coord_y": " 51.195116",
        "created_at": "2021-03-26T10:35:33.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 51,
        "region_id": "1",
        "company_id": "32",
        "name": "ТОО «Тэк Оазис Газ»",
        "comment": "Арыстан Арена артында",
        "is_open": "0",
        "coord_x": "43.649452",
        "coord_y": " 51.179346",
        "created_at": "2021-03-26T10:35:43.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 52,
        "region_id": "1",
        "company_id": "32",
        "name": "ТОО «Тэк Оазис Газ»",
        "comment": "28 а шағын аудан Сұңқар бензин заправкасында",
        "is_open": "0",
        "coord_x": "43.661001",
        "coord_y": " 51.173049",
        "created_at": "2021-03-26T10:35:49.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 53,
        "region_id": "1",
        "company_id": "33",
        "name": "ИП «Апиева»",
        "comment": "Шығыс-3 ке қарама қарсы",
        "is_open": "0",
        "coord_x": "43.688171",
        "coord_y": " 51.195598",
        "created_at": "2021-03-26T10:36:02.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 54,
        "region_id": "1",
        "company_id": "34",
        "name": "ИП «Турабаев»",
        "comment": "Шығыс-2 ге қарама қарсы",
        "is_open": "0",
        "coord_x": "43.681791",
        "coord_y": " 51.195424",
        "created_at": "2021-03-26T10:36:25.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 55,
        "region_id": "1",
        "company_id": "35",
        "name": "ТОО «Трансавис»",
        "comment": "Шығыс-2 ге қарама қарсы",
        "is_open": "0",
        "coord_x": "43.681062",
        "coord_y": " 51.195334",
        "created_at": "2021-03-26T10:36:28.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 56,
        "region_id": "1",
        "company_id": "36",
        "name": "ИП «Асель»",
        "comment": "Шығыс-3 ке қарама қарсы",
        "is_open": "0",
        "coord_x": "43.688891",
        "coord_y": " 51.194624",
        "created_at": "2021-03-26T10:36:31.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 57,
        "region_id": "1",
        "company_id": "37",
        "name": "ТОО «АктауОблГаз»",
        "comment": "Шығыс-3 ке қарама-қарсы",
        "is_open": "0",
        "coord_x": "43.687206",
        "coord_y": " 51.195978",
        "created_at": "2021-03-26T10:36:35.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 58,
        "region_id": "1",
        "company_id": "38",
        "name": "ИП «Баржиков»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.672319",
        "coord_y": " 51.229078",
        "created_at": "2021-03-26T10:36:38.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 59,
        "region_id": "1",
        "company_id": "39",
        "name": "ТОО «КУС»",
        "comment": "«АвтоЦОН» қасында",
        "is_open": "0",
        "coord_x": "43.702402",
        "coord_y": " 51.178031",
        "created_at": "2021-03-26T10:36:42.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "Чжан Дунчэнь",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 60,
        "region_id": "1",
        "company_id": "40",
        "name": "ИП «Васильев»",
        "comment": "Приозерный елді мекені аумағында",
        "is_open": "0",
        "coord_x": "43.643236",
        "coord_y": " 51.200489",
        "created_at": "2021-03-26T10:36:45.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 61,
        "region_id": "1",
        "company_id": "41",
        "name": "ИП «Мерей»",
        "comment": "Приозерный елді мекені  «Мағаш» заводы аумағында",
        "is_open": "0",
        "coord_x": "43.643714",
        "coord_y": " 51.208014",
        "created_at": "2021-03-26T10:37:17.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 62,
        "region_id": "1",
        "company_id": "42",
        "name": "ТОО «SinoOil»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.670005",
        "coord_y": " 51.243921",
        "created_at": "2021-03-26T10:37:21.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "Республика Казахстан, город Алматы, Улица Муратбаева, 147.",
        "gso_id": "0"
    },
    {
        "id": 63,
        "region_id": "1",
        "company_id": "43",
        "name": "ИП «Каламбаева»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.672373",
        "coord_y": " 51.226439",
        "created_at": "2021-03-26T10:37:24.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 64,
        "region_id": "1",
        "company_id": "44",
        "name": "ТОО «En-1»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.663900",
        "coord_y": " 51.238199",
        "created_at": "2021-03-26T10:37:27.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 65,
        "region_id": "1",
        "company_id": "45",
        "name": "ТОО «CASPIAN Autogaz»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.669343",
        "coord_y": " 51.254007",
        "created_at": "2021-03-26T10:37:30.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 66,
        "region_id": "1",
        "company_id": "45",
        "name": "ТОО «CASPIAN Autogaz»",
        "comment": "МАЭК аумағында Құрық жолында",
        "is_open": "0",
        "coord_x": "43.605250",
        "coord_y": " 51.298759",
        "created_at": "2021-03-26T10:37:34.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 67,
        "region_id": "1",
        "company_id": "45",
        "name": "ТОО «CASPIAN Autogaz»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.670594",
        "coord_y": " 51.238919",
        "created_at": "2021-03-26T10:37:39.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 68,
        "region_id": "1",
        "company_id": "46",
        "name": "ИП «Дүйсебек»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.671880",
        "coord_y": " 51.239777",
        "created_at": "2021-03-26T10:38:03.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    },
    {
        "id": 69,
        "region_id": "1",
        "company_id": "47",
        "name": "ИП «Мангыбаев»",
        "comment": "ХГМЗ аумағында",
        "is_open": "0",
        "coord_x": "43.672317",
        "coord_y": " 51.237504",
        "created_at": "2021-03-26T10:38:07.000000Z",
        "updated_at": "-000001-11-30T00:00:00.000000Z",
        "status": "1",
        "boss": "",
        "address": "",
        "gso_id": "0"
    }
]
''';
}

class JsonUtils {
  static String mapJson = '''
  {
  "cities": [
    {
        "Актау": [
            {
                "12-8": [
                    {
                        "isActive": true,
                        "lon": 51.155306,
                        "lat": 43.663441,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ],
                "28-a": [
                    {
                        "isActive": false,
                        "lon": 52.843327,
                        "lat": 43.342095,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ]
            }
        ],
        "Жанаозен": [
            {
                "3-4": [
                    {
                        "isActive": true,
                        "lon": 43,
                        "lat": 44,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ],
                "4-6": [
                    {
                        "isActive": false,
                        "lon": 52.873188,
                        "lat": 43.357568,
                        "title": "КазМунайГаз",
                        "date": "13:03 20.03.2021"
                    }
                ]
            }
        ]
    }
  ]
}
''';
}

List<String> cities = [
  'город Актау',
  'город Жанаозен',
  'Бейнеуский район',
  'Каракиянский район',
  'Мангистауский район',
  'Мунайлинский район',
  'Тупкараганский район',
];

List<CameraPosition> positions = [
  CameraPosition(
    target: LatLng(43.653482, 51.178438),
    zoom: 12,
  ),
  CameraPosition(
    target: LatLng(43.345590, 52.855986),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(45.323931, 55.173259),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(43.179964, 51.678460),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(44.138225, 52.164204),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(43.694123, 51.304449),
    zoom: 13,
  ),
  CameraPosition(
    target: LatLng(44.501865, 50.264099),
    zoom: 13,
  ),
];

Set<Marker> markers = {
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.667631, 51.150840),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.668038, 51.194485),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  ),
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.666453, 51.154716),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
  Marker(
    markerId: MarkerId('id-1'),
    position: LatLng(43.641045, 51.181734),
    infoWindow: InfoWindow(title: 'aaaasdnad', snippet: 'AZadsaS'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  ),
};

String mapStyle = '''
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#523735"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#c9b2a6"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#dcd2be"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ae9e90"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#93817c"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#a5b076"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#447530"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f1e6"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#fdfcf8"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f8c967"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#e9bc62"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e98d58"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#db8555"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#806b63"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8f7d77"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ebe3cd"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dfd2ae"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#b9d3c2"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#92998d"
      }
    ]
  }
]
  ''';
