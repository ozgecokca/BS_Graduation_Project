function [enc,s,s2,s3]= LFSR(s,s2,s3)
 s = [1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1]
p = [1 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]

fb = s&p;
x = fb(1);

for i=2:18
    if(p(i)==1)
       x = xor(fb(i),x)
    end
end
seq1 = s(1);
s = circshift(s,1)

s(18) = x;

 s2 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1]
p2 = [1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]

fb2 = s2&p2;
x = fb2(1)


for i=2:22
    if(p2(i)==1)
    x = xor(fb2(i),x)
    end
end
seq2 = s2(1);
s2 = circshift(s2,1)

s2(22) = x;

 s3 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 0 1]
p3 = [1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0]

fb3 = s3&p3;
x = fb3(1)

for i=2:23
     if(p3(i)==1)
    x = xor(fb3(i),x)
     end
end
seq3 = s3(1);
s3 = circshift(s3,1)

s3(23) = x;
enc=xor(seq3,seq2);
enc =xor(enc,seq1);
end




