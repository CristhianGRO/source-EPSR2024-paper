%================== Traduz da matriz de barra para a de linhas e define se usa o tap ===============
% k - endere�o da barra k
% m - endere�o da barra m
function [km,flag] = km_flag(Nramos, DRAM, k, m)
km = 0;
flag = 2;
for i=1:Nramos
    if k==DRAM.de(i) && m==DRAM.para(i)
        km = i;
        flag = 1;           %de-para. Usa o a
    elseif k==DRAM.para(i) && m==DRAM.de(i)
        km = i;
        flag = 0;           %para-de. N�o usa o a
    end
end
