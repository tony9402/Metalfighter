

'******** 메탈파이터 기본형 프로그램 ********
DIM A AS BYTE
DIM A_old AS BYTE
DIM B AS BYTE
DIM 물건집은상태 AS BYTE
DIM 모터ONOFF AS BYTE
DIM 자세 AS BYTE

DIM S6 AS BYTE
DIM S7 AS BYTE
DIM S8 AS BYTE

DIM S12 AS BYTE
DIM S13 AS BYTE
DIM S14 AS BYTE

CONST 하한전압 = 106	'154 '약6V전압

DIR G6A,1,0,0,1,0,0		'모터0~5번
DIR G6B,1,1,1,1,1,1		'모터6~11번
DIR G6C,0,0,0,0,0,0		'모터12~17번
DIR G6D,0,1,1,0,1,0		'모터18~23번

'***** 초기선언 *********************************
모터ONOFF = 0
보행순서 = 0
반전체크 = 0
기울기확인횟수 = 0
물건집은상태 = 0

'****초기위치 피드백*****************************

GOSUB MOTOR_ON

SPEED 5
GOSUB 기본자세


GOTO MAIN
'************************************************
'************************************************
'************************************************

시작음:
    TEMPO 220
    MUSIC "O23EAB7EA>3#C"
    RETURN
    '************************************************
종료음:
    TEMPO 220
    MUSIC "O38GD<BGD<BG"
    RETURN
    '************************************************
경고음:
    TEMPO 180
    MUSIC "O13A"
    DELAY 300

    RETURN
    '************************************************
MOTOR_FAST_ON:

    MOTOR G6B
    MOTOR G6C
    MOTOR G6A
    MOTOR G6D

    모터ONOFF = 0

    RETURN

    '************************************************
    '************************************************
MOTOR_ON:

    GOSUB MOTOR_GET

    MOTOR G6B
    DELAY 50
    MOTOR G6C
    DELAY 50
    MOTOR G6A
    DELAY 50
    MOTOR G6D

    모터ONOFF = 0
    GOSUB 시작음			
    RETURN

    '************************************************
    '전포트서보모터사용설정
MOTOR_OFF:

    MOTOROFF G6B
    MOTOROFF G6C
    MOTOROFF G6A
    MOTOROFF G6D
    모터ONOFF = 1	
    GOSUB MOTOR_GET	
    GOSUB 종료음	
    RETURN
    '************************************************
    '위치값피드백
MOTOR_GET:
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,0
    GETMOTORSET G6C,1,1,1,0,0,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN
    '************************************************
기본자세:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT
    자세 = 0
    물건집은상태 = 0
    RETURN
    '**********************************************
RX_EXIT:

    ERX 4800, A, MAIN

    GOTO RX_EXIT
    '**********************************************
GOSUB_RX_EXIT:

    ERX 4800, A, GOSUB_RX_EXIT2

    GOTO GOSUB_RX_EXIT

GOSUB_RX_EXIT2:
    RETURN
    '**********************************************

모터ONOFF_LED:
    IF 모터ONOFF = 1  THEN
        OUT 52,1
        DELAY 200
        OUT 52,0
        DELAY 200
    ENDIF
    RETURN
    '**********************************************
LOW_Voltage:

    B = AD(6)

    IF B < 하한전압 THEN
        GOSUB 경고음

    ENDIF

    RETURN
    '******************************************	
MAIN: '라벨설정


    'GOSUB LOW_Voltage


    GOSUB 모터ONOFF_LED

    ERX 4800,A,MAIN
    A_old = A

    ON A GOTO MAIN,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,KEY15,KEY16,KEY17,KEY18 ,KEY19,KEY20,KEY21,KEY22,KEY23,KEY24,KEY25,KEY26,KEY27,KEY28 ,KEY29,KEY30,KEY31,KEY32

    GOTO MAIN	
    '*******************************************
    '		MAIN 라벨로 가기
    '*******************************************

KEY1:
    GOTO RX_EXIT
    '*******************************************
KEY2:

    GOTO RX_EXIT
    '*******************************************
KEY3:

    GOTO RX_EXIT
    '*******************************************
KEY4:

    GOTO RX_EXIT
    '*******************************************
KEY5:

    GOTO RX_EXIT
    '*******************************************
KEY6:

    GOTO RX_EXIT
    '*******************************************
KEY7:

    GOTO RX_EXIT
    '*******************************************
KEY8:

    GOTO RX_EXIT
    '*******************************************
KEY9:

    GOTO RX_EXIT
    '*******************************************
KEY10: '0

    GOTO RX_EXIT
    '*******************************************
KEY11: ' ▲

    GOTO RX_EXIT
    '*******************************************
KEY12: ' ▼

    GOTO RX_EXIT
    '*******************************************
KEY13: '▶

    GOTO RX_EXIT
    '*******************************************
KEY14: ' ◀

    GOTO RX_EXIT
    '*******************************************
KEY15: ' A

    GOTO RX_EXIT
    '*******************************************
KEY16: ' POWER

    GOTO RX_EXIT
    '*******************************************
KEY17: ' C

    GOTO RX_EXIT
    '*******************************************
KEY18: ' E
    
    GOTO RX_EXIT
    '*******************************************
KEY19: ' P2

    GOTO RX_EXIT
    '*******************************************
KEY20: ' B	

    GOTO RX_EXIT
    '*******************************************
KEY21: ' △

    GOTO RX_EXIT
        '*******************************************
KEY22: ' *	

    GOTO RX_EXIT
    '*******************************************
KEY23: ' G
    
    GOTO RX_EXIT
    '*******************************************
KEY24: ' #

    GOTO RX_EXIT
    '*******************************************
KEY25: ' P1

    GOTO RX_EXIT
    '*******************************************
KEY26: ' ■
   
    GOTO RX_EXIT
    '*******************************************
KEY27: ' D

    GOTO RX_EXIT
    '*******************************************
KEY28: ' ◁

    GOTO RX_EXIT
    '*******************************************
KEY29: ' □
    
    GOTO RX_EXIT
    '*******************************************
KEY30: ' ▷

    GOTO RX_EXIT
    '*******************************************
KEY31: ' ▽
    
    GOTO RX_EXIT
    '*******************************************

KEY32: ' F

    GOTO RX_EXIT
    '*******************************************