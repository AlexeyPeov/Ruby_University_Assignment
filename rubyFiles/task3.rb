# 3. Написать программу, которая начинается с чтения банковского
# баланса клиента из файла с именем balance.txt, содержащего одну
# строку со стартовым балансом клиента. Если файла не
# существует, используется стартовый баланс 100.0, который
# должен быть константой.



# После этого программа должна предложить клиенту внести деньги,
# вывести деньги, проверить баланс или выйти, используя буквы D
# (deposit), W (withdraw), B (balance) и Q (quit). 

# Программа должна
# принимать на вход значения в верхнем или нижнем регистре. Для
# депозитов (D) программа должна подсказывать сумму. Сумма
# должна быть больше нуля. Если сумма действительна, программа
# добавляет сумму депозита к балансу клиента и отображает новый
# баланс.
# При снятии средств (W) программа должна выдать запрос, в
# котором необходимо указать сумму. Сумма должна быть больше
# нуля и меньше или равна текущему балансу. Если сумма
# корректна, программа вычитает сумму вывода из баланса клиента
# и
# отображает новый баланс.
# При проверке баланса (B) программа должна вывести текущий
# баланс.
# Если клиент решит выйти из программы (Q), программа должна
# записать текущий баланс обратно в файл balance.txt.
# В случае неправильного ввода (команда или сумма), программа
# должна выдать соответствующее сообщение об ошибке, которое
# сообщит клиенту, как ее исправить. Нельзя просто выводить error