% oku = fopen('krpt.txt','r');
% Data = fread(oku);
% str = char(Data);
% fclose(oku);

str = 'kriptografi';

met =reshape(dec2bin(str, 8).'-'0',1,[]);

%------------encryption-------------
s = [1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s2 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s3 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 0 1];

%met=[1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];

boyut =length(met);


for j=1:boyut
  [enc,s,s2,s3] = lfsr(s,s2,s3);
    result(j)=xor(met(j),enc);
end

%---------decryption-------------------

s = [1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s2 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s3 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 0 1];

for j=1:boyut
  [enc,s,s2,s3] = lfsr(s,s2,s3);
    pt(j)=xor(result(j),enc);
end



 pt_re =reshape(string((double(pt))),1,[]);
x = 1;
y=8;
mesaj = "";
for i=1:length(pt_re)
    temp = char(bin2dec(char(strjoin(pt_re(x:y)))));
    %disp(temp);
    newstr = insertAfter(mesaj,mesaj(end),temp);
    mesaj = newstr;
    if (y>= length(pt_re))
        break;
    end
    x = x+8;
    y = y+8;
    i = i+8;
end


% m= reshape(char(pt + '0'),[],8);
% 
% [a b]=size(pt);
% mesaj = ""
% 
% for i=1:8:(b/8)    
%     mesaj = strcat(mesaj,char(double(pt(i:i+7))));
% end

