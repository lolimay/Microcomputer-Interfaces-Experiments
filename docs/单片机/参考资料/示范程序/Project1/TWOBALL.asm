;  TWOBALL.ASM�����ʾ����ʹ����С�ư���һ����Ƶ�ʺ�˳��ѭ��������
;  ����С����ѭ������һλ��Ȼ����ѭ������һλ��

init_val        equ     3Fh     ; ��ʼ����ʾֵ,��������ܵ͵�ƽ��Ч.
                                ; 3F˵�������������
dsply_port	equ	90h	; P1�ڵ�ַ

	org	0000h
init:   ljmp    tball

	org	0100h            ;��ʼ������
tball:  
	mov     a, #init_val     ; �����ʼ����ʾ����ֵ
        mov     r3, #06h         ; ��λ����ֵ

lup1:   mov     dsply_port, a    ; A����ֵ��ʾ

	mov	r0, #00h	 
	mov	r1, #00h
	mov	r2, #02h
	acall	dly		 ; ������ʱ����

	rr	a		; ѭ������һλ
        dec     r3               
        cjne    r3, #00h, lup1  ; ��������һ

        mov     r3, #06h
	
lup2:   mov     dsply_port, a   ; A����ֵ��ʾ

	mov	r0, #00h	
	mov	r1, #00h
	mov	r2, #02h
	acall	dly		; ������ʱ����

	rl	a		; ѭ������һλ
        dec     r3              
        cjne    r3, #00h, lup2  ; ��������һ
 
        ajmp    tball            ;ѭ��


dly:	dec	r0		; ��ʱ�ӳ��򣬶�����ʾƵ��
	nop
	nop
	cjne	r0, #00h, dly
	dec	r1
	nop
	nop
	cjne	r1, #00h, dly
	dec	r2
	nop
	nop
	cjne	r2, #00h, dly
	ret

	end
