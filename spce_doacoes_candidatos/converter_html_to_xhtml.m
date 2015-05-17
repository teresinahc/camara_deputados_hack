function converter_html_to_xhtml()
% funcao chama cada arquivo html de um dado diretorio e o envia para o
% conversor tidy. Tidy converte arquivos html em xhtml
% 
% Tempo aproximado para conversao de todos os cand. dep. fed. =22horas
% converter_html_to_xhtml()
tic
%obtem lista de arquivos que atendem a determinado critério
lista_htmls=dir('*.html');
for i=1:length(lista_htmls)
     strcat('Pct=',num2str((i/length(lista_htmls))*100),'%')
     arq=lista_htmls(i).name;
     if(java.io.File([arq(1:end-5),'.xhtml']).exists==1) %testa se o arquivo já foi baixado
            disp(strcat('arquivo_ja_transformado=',char(arq)))
           continue; %nao baixar novamente, pular para proximo
     else
         disp(strcat('arquivo sera transformado=',char(arq)))
           
           command=['tidy.exe -raw -utf8 -numeric -asxhtml -i -f logtidy -o ',arq(1:end-5),'.xhtml ',arq(1:end-5),'.html'];
           %executa o comando no terminal de console
           [status,cmdout] = dos(command,'-echo');     
     end
    
end
toc
