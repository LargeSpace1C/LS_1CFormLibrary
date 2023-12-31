﻿// Библиотека общих функций по работе с формами в программном режиме
// Версия библиотеки: 26.07.2023
//

//////////////////////////////////////////////////////////////////////////////
// Для применения методов этого модуля необходимо в форме включить расширение 
// метода "ПриСозданииНаСервере" и "ПослеЗаписиНаСервере" у формы и вставить в модуль следующий код:
//

//////////////////////////////////////////////////////////////////////////////
//#Область ОбработчикиСобытийФормы
//
//&НаСервере
//Процедура ЛС_ПриСозданииНаСервереПеред(Отказ, СтандартнаяОбработка)
//	БЛС_ФормыИнтерфейс.ДополнитьФормуТолькоРеквизитами(ЭтаФорма);
//КонецПроцедуры
//
//&НаСервере
//Процедура ЛС_ПриСозданииНаСервереПосле(Отказ, СтандартнаяОбработка)
//	БЛС_ФормыИнтерфейс.ДополнитьФормуПолями(ЭтаФорма);
//КонецПроцедуры

//
//#КонецОбласти
//
//#Область ОбработчикиКомандФормы
//
//&НаКлиенте
//Процедура ЛС_ОбработчикКоманды(Команда)
//	БЛС_ФормыОбработчики.ОбработатьКоманду(Команда, ЭтотОбъект);
//КонецПроцедуры
//
//#КонецОбласти
//
//#Область ОбработчикиСобытийЭлементов
//
//&НаКлиенте
//Процедура ЛС_ОбработчикПриИзменении(Элемент)
//	БЛС_ФормыОбработчики.ПриИзмененииРеквизитаУниверсальный(Элемент, ЭтотОбъект);	
//КонецПроцедуры
//
//&НаКлиенте
//Процедура ЛС_ОбработчикНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
//	БЛС_ФормыОбработчики.НачалоВыбораРеквизитаУниверсальный(Элемент, ДанныеВыбора, СтандартнаяОбработка);	
//КонецПроцедуры
//
//&НаКлиенте
//Процедура ЛС_Нажатие(Элемент, СтандартнаяОбработка)
//	БЛС_ФормыОбработчики.НажатиеУниверсальный(Элемент, ЭтаФорма, СтандартнаяОбработка);	
//КонецПроцедуры
//
//#КонецОбласти
//////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

&НаСервере
Процедура ДополнитьФормуРеквизитами(Форма) Экспорт
	
	Если НЕ ПривилегированныйРежим() Тогда
		УстановитьПривилегированныйРежим(Истина);
	КонецЕсли;

	МассивНовыхРеквизитов = Новый Массив();
	БЛС_ФормыЭлементы.ДополнитьФормуРеквизитами(Форма, МассивНовыхРеквизитов);
	Форма.ИзменитьРеквизиты(МассивНовыхРеквизитов);
	
	УстановитьПривилегированныйРежим(Ложь);
	
	ДополнитьФормуПолями(Форма);
	
КонецПроцедуры

&НаСервере
Процедура ДополнитьФормуТолькоРеквизитами(Форма) Экспорт
	
	Если НЕ ПривилегированныйРежим() Тогда
		УстановитьПривилегированныйРежим(Истина);
	КонецЕсли;

	МассивНовыхРеквизитов = Новый Массив();
	БЛС_ФормыЭлементы.ДополнитьФормуРеквизитами(Форма, МассивНовыхРеквизитов);
	Форма.ИзменитьРеквизиты(МассивНовыхРеквизитов);
	
	УстановитьПривилегированныйРежим(Ложь);
	
КонецПроцедуры

&НаСервере
Процедура ДополнитьФормуПолями(Форма) Экспорт
	
	БЛС_ФормыЭлементы.ДополнитьФормуПолями(Форма);
		
КонецПроцедуры

#КонецОбласти
