FasdUAS 1.101.10   ��   ��    k             l     ��  ��    - 'Script to extract hits by response code     � 	 	 N S c r i p t   t o   e x t r a c t   h i t s   b y   r e s p o n s e   c o d e   
  
 l     ��  ��    , &Author: Rahul Jain - rajain@akamai.com     �   L A u t h o r :   R a h u l   J a i n   -   r a j a i n @ a k a m a i . c o m      l     ��������  ��  ��        l    ; ����  Z     ;  ��   I     �� ���� 0 appisrunning appIsRunning   ��  m       �    G o o g l e   C h r o m e��  ��    O   	 .    Z    -  ��   ?      !   l    "���� " I   �� #��
�� .corecnte****       **** # l    $���� $ 6   % & % 2    ��
�� 
cwin & =    ' ( ' 1    ��
�� 
pvis ( m    ��
�� boovtrue��  ��  ��  ��  ��   ! m    ����    l  " "�� ) *��   ) 7 1 running with a visible window, ready for new tab    * � + + b   r u n n i n g   w i t h   a   v i s i b l e   w i n d o w ,   r e a d y   f o r   n e w   t a b��    k   & - , ,  - . - l  & &�� / 0��   / 3 - running but no visible window, so create one    0 � 1 1 Z   r u n n i n g   b u t   n o   v i s i b l e   w i n d o w ,   s o   c r e a t e   o n e .  2�� 2 I  & -���� 3
�� .corecrel****      � null��   3 �� 4��
�� 
kocl 4 m   ( )��
�� 
cwin��  ��    m   	 
 5 5�                                                                                  rimZ  alis    `  	res-mpzb8                  �c��H+     ZGoogle Chrome.app                                               ���bj}        ����  	                Applications    �c�      �b��       Z  )res-mpzb8:Applications: Google Chrome.app   $  G o o g l e   C h r o m e . a p p   	 r e s - m p z b 8  Applications/Google Chrome.app  / ��  ��    O   1 ; 6 7 6 k   5 : 8 8  9 : 9 l  5 5�� ; <��   ; * $ chrome app not running, so start it    < � = = H   c h r o m e   a p p   n o t   r u n n i n g ,   s o   s t a r t   i t :  >�� > I  5 :�� ?��
�� .sysoexecTEXT���     TEXT ? m   5 6 @ @ � A A . o p e n   - a   " G o o g l e   C h r o m e "��  ��   7 m   1 2 B B�                                                                                  rimZ  alis    `  	res-mpzb8                  �c��H+     ZGoogle Chrome.app                                               ���bj}        ����  	                Applications    �c�      �b��       Z  )res-mpzb8:Applications: Google Chrome.app   $  G o o g l e   C h r o m e . a p p   	 r e s - m p z b 8  Applications/Google Chrome.app  / ��  ��  ��     C D C l     ��������  ��  ��   D  E F E l     �� G H��   G E ? now that we have made sure chrome is running and has a visible    H � I I ~   n o w   t h a t   w e   h a v e   m a d e   s u r e   c h r o m e   i s   r u n n i n g   a n d   h a s   a   v i s i b l e F  J K J l     �� L M��   L - ' window create a new tab in that window    M � N N N   w i n d o w   c r e a t e   a   n e w   t a b   i n   t h a t   w i n d o w K  O P O l     �� Q R��   Q , & and activate it to bring to the front    R � S S L   a n d   a c t i v a t e   i t   t o   b r i n g   t o   t h e   f r o n t P  T U T l     �� V W��   V 0 * read URLs from a text file (URL_list.txt)    W � X X T   r e a d   U R L s   f r o m   a   t e x t   f i l e   ( U R L _ l i s t . t x t ) U  Y Z Y l  < N [���� [ r   < N \ ] \ n   < J ^ _ ^ 2  F J��
�� 
cpar _ l  < F `���� ` I  < F�� a b
�� .rdwrread****        **** a 4   < @�� c
�� 
psxf c m   > ? d d � e e � / U s e r s / r a j a i n / D o c u m e n t s / A c c o u n t s / S e a r s / C P C o d e B a s e l i n i n g / U R L _ l i s t . t x t b �� f��
�� 
as   f m   A B��
�� 
ctxt��  ��  ��   ] o      ���� 0 url_list URL_list��  ��   Z  g h g l  O � i���� i O   O � j k j k   S � l l  m n m I  S X������
�� .miscactvnull��� ��� null��  ��   n  o�� o X   Y � p�� q p Z   m � r s���� r ?  m t t u t n   m r v w v 1   n r��
�� 
leng w o   m n���� 0 nextline nextLine u m   r s����   s k   w � x x  y z y O   w � { | { I  ~ ����� }
�� .corecrel****      � null��   } �� ~ 
�� 
kocl ~ m   � ���
�� 
CrTb  �� ���
�� 
prdt � K   � � � � �� ���
�� 
URL  � o   � ����� 0 nextline nextLine��  ��   | 4  w {�� �
�� 
cwin � m   y z����  z  � � � l  � � � � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  let the page load    � � � � " l e t   t h e   p a g e   l o a d �  ��� � O   � � � � � l  � � � � � � k   � � � �  � � � I  � ��� � �
�� .prcskprsnull���    utxt � m   � � � � � � �  s � �� ���
�� 
faal � m   � ���
�� eMdsKcmd��   �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  � � � I  � ��� ���
�� .prcskprsnull���    utxt � o   � ���
�� 
ret ��   �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  � � � I  � ��� � �
�� .prcskprsnull���    utxt � m   � � � � � � �  w � �� ���
�� 
faal � m   � ���
�� eMdsKcmd��   �  ��� � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��  ��   � t n do not switch to any other window. save and close will be executed on whatever window is currently in focus.     � � � � �   d o   n o t   s w i t c h   t o   a n y   o t h e r   w i n d o w .   s a v e   a n d   c l o s e   w i l l   b e   e x e c u t e d   o n   w h a t e v e r   w i n d o w   i s   c u r r e n t l y   i n   f o c u s .   � m   � � � ��                                                                                  sevs  alis    �  	res-mpzb8                  �c��H+   [System Events.app                                               ��̀�>        ����  	                CoreServices    �c�      ̀Վ     [ �f �c  :res-mpzb8:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p   	 r e s - m p z b 8  -System/Library/CoreServices/System Events.app   / ��  ��  ��  ��  �� 0 nextline nextLine q o   \ _���� 0 url_list URL_list��   k m   O P � ��                                                                                  rimZ  alis    `  	res-mpzb8                  �c��H+     ZGoogle Chrome.app                                               ���bj}        ����  	                Applications    �c�      �b��       Z  )res-mpzb8:Applications: Google Chrome.app   $  G o o g l e   C h r o m e . a p p   	 r e s - m p z b 8  Applications/Google Chrome.app  / ��  ��  ��   h  � � � i      � � � I      �� ����� 0 appisrunning appIsRunning �  ��� � o      ���� 0 appname appName��  ��   � O     � � � E     � � � l   	 ����� � n    	 � � � 1    	��
�� 
pnam � 2   ��
�� 
prcs��  ��   � o   	 
���� 0 appname appName � m      � ��                                                                                  sevs  alis    �  	res-mpzb8                  �c��H+   [System Events.app                                               ��̀�>        ����  	                CoreServices    �c�      ̀Վ     [ �f �c  :res-mpzb8:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p   	 r e s - m p z b 8  -System/Library/CoreServices/System Events.app   / ��   �  ��� � l     ��������  ��  ��  ��       �� � � ���   � ������ 0 appisrunning appIsRunning
�� .aevtoappnull  �   � **** � �� ����� � ����� 0 appisrunning appIsRunning�� �� ���  �  ���� 0 appname appName��   � ���� 0 appname appName �  �����
�� 
prcs
�� 
pnam�� � 	*�-�,�U � �� ���~ � ��}
�� .aevtoappnull  �   � **** � k     � � �   � �  Y � �  g�|�|  �  �~   � �{�{ 0 nextline nextLine � " �z 5�y ��x�w�v�u @�t�s d�r�q�p�o�n�m�l�k�j�i�h�g�f�e � ��d�c�b�a ��z 0 appisrunning appIsRunning
�y 
cwin �  
�x 
pvis
�w .corecnte****       ****
�v 
kocl
�u .corecrel****      � null
�t .sysoexecTEXT���     TEXT
�s 
psxf
�r 
as  
�q 
ctxt
�p .rdwrread****        ****
�o 
cpar�n 0 url_list URL_list
�m .miscactvnull��� ��� null
�l 
cobj
�k 
leng
�j 
CrTb
�i 
prdt
�h 
URL �g �f 
�e .sysodelanull��� ��� nmbr
�d 
faal
�c eMdsKcmd
�b .prcskprsnull���    utxt
�a 
ret �} �*�k+  *� "*�-�[�,\Ze81j j hY 	*��l UY � �j 
UO)��/��l a -E` O� �*j O �_ [�a l kh  �a ,j f*�k/ *�a a a �la  UOa j Oa  7a a a l Okj O_  j Okj Oa !a a l Okj UY h[OY��Uascr  ��ޭ