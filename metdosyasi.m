oku = fopen('metindosyasi.txt','r');
Data = fread(oku);
CharData = char(Data);
fclose(oku);
disp(Data);

file =reshape(dec2bin(Data, 8).'-'0',1,[]);

%------------encrp-------------
s = [1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s2 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s3 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 0 1];


boyut =length(file);


for j=1:boyut
  [enc,s,s2,s3] = lfsr(s,s2,s3);
    result(j)=xor(file(j),enc);
end

%---------dcrp-------------------

s = [1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s2 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 1];
s3 = [1 0 1 0 1 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 0 0 1];

for j=1:boyut
  [enc,s,s2,s3] = lfsr(s,s2,s3);
    pt(j)=xor(result(j),enc);
end


% pt_re =reshape(string((double(pt))),1,[]);
% 
% x = 1;
% y=8;
% mesaj = "";
% for i=1:length(pt_re)
%     mesaj = strcat(mesaj, char(bin2dec(char(strjoin(pt_re(x:y))))));
%     if (y>= length(pt_re))
%         break;
%     end
%     x = x+8;
%     y = y+8;
%     i = i+8;
% end
% 
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


