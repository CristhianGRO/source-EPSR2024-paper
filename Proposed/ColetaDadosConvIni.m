if ~isempty(fv) && Nfv==1
    aux_end = 2*(DBAR.NPQ+DBAR.NFV)+DBAR.NPV;
    resPrint(it+1,1:2) = [mismatch((aux_end + 1),1)  mismatch((aux_end + 2*Nfv+1),1)  ];  % deltaG1 e deltaG3
    varPrint(it+1,1:4) = [fv.Vfv(1) fv.Ifv(1) fv.m(1) fv.alpha(1)];
    dataDebug(it+1,1:9) = [ it fv.Vfv(1) fv.Ifv(1) fv.Vfv(1)*fv.Ifv(1) fv.m(1) fv.alpha(1)*180/pi sqrt(3/8)*fv.m(1)*fv.Vfv(1) ...
        fv.Pkm(1) fv.Qkm(1) ];
    if fv.cont(1)==1            % control FPF
        resPrint(it+1,3) = mismatch(aux_end+Nfv+1,1);       % deltaG2
        resPrint(it+1,5) = mismatch(aux_end+3*Nfv+1,1);     % deltaGfpf
        varPrint(it+1,5:7) = [fv.xiC(1) fv.Qli(1) fv.Qls(1)];
        dataDebug(end,10:13) = [fv.Qdisp(1) fv.xiC(1) fv.Qli(1) fv.Qls(1)];
    elseif fv.cont(1)==2        % control VW
        resPrint(it+1,4) = mismatch(aux_end+Nfv+1,1);       % deltaG2
        resPrint(it+1,9) = mismatch(aux_end+3*Nfv+fv.Nfpf+1,1);     % deltaGvw6
        varPrint(it+1,5:9) = [fv.xiC(1) fv.Pmax(1) fv.Pls(1) fv.PmaxLI(1) fv.PmaxLS(1)];
        dataDebug(end,10:15) = [fv.xiC(1) fv.Pmax(1) fv.Pls(1) fv.PmaxLI(1) fv.PmaxLS(1) DBAR.V(fv.bar(1))];
    elseif fv.cont(1)==3        % control VV
        resPrint(it+1,3) = mismatch(aux_end+Nfv+1,1);       % deltaG2
        resPrint(it+1,5) = mismatch(aux_end+3*Nfv+fv.Nfpf+fv.Nvw + 1,1);    % deltaGvv
        varPrint(it+1,5) = fv.xiC(1);
        dataDebug(end,10:12) = [fv.Qdisp(1) fv.xiC(1) DBAR.V(fv.bar(1))];
    end
end