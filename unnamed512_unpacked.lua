d={
 1,2,2,2,1,2,2,0, --chn 0 bass
 0,1,3,3,3,3,3,0, --chn 1 mid
 5,5,5,5,0,5,5,5, --chn 2 snare
 7,7,7,7,1,7,7,7, --chn 3 kick 
 1,0,0,1,0,0,3,0, --pat 2
 1,0,1,0,2,0,3,0, --pat 3
 1,0,4,0,5,0,4,0, --pat 4
 0,0,0,0,1,0,0,0, --pat 5
 0,0,0,0,1,0,1,0, --pat 6
 1,1,0,1,0,0,0,0, --pat 7
 1,1,0,1,1,1,1,1, --pat 8
 rect,rectb}

t=0
c=0

function TIC()
 for k=0,3 do
  p=t//1024
  poke(65896,48)
  e=t*(2-k//2)
  a=d[8*k+p+1]+t//128%8//7
  n=d[8*a+e//16%8+17]
  d[-k]=-e%16%(a//2*16*n+1)
  sfx(
   k%3,
   3
    +k*12
    +p//4*(1-t//128%8//4)
    -n*n+10*n
    -k//3*e%16*8
    ~0,
   2,
   k,
   d[-k]
  )
 end
 t=t+1,t<8192 or exit()
 c=c+d[-2]
 cls(c%9*4)

 n=t//1024
 q=t/299
 m=math.pi*(3-5^.5) 
 for k=0,1 do
  for i=0,2400 do
   z=1-i/1200
   r=(1-z*z)^.5
   w=m*i
   x=math.cos(w)*r
   y=math.sin(w)*r
   r=s(s(x*5+c/7)
    +s(y*5+c/8)
    +s(z*5+c/9)
    +q/3)^(c%7+1)*(s(c*(71+p))^2*2)/4+1
   z=z*r+2.1
   d[p//3%2+89](
    x*r*99/z+120-6/z+d[0]/4,
    (y*r*k+1-k)*99/z+68-6/z+d[0]/4,
    12/z-d[0]/2,
    12/z-d[0]/2,
    k*(d[-3]*z+p%5*y*s(c)*d[-1])/3
   )
  end
 end 
end
s=math.sin
-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

