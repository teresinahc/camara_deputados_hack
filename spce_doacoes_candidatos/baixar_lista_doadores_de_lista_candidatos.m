function baixar_lista_doadores_de_lista_candidatos(arq_candidatos_entrada)
% funcao que recebe um arquivo xml contendo a lista de candidatos dos quais se quer saber a lista de doadores 
% 
% baixar_lista_doadores_de_lista_candidatos(arq_candidatos_entrada)


% [sqCand,sgUe,name,numero,partido]=identificador_candidatos_nacional('candidatos_AC.xml'); %teste
[sqCand,sgUe,name,numero,partido]=identificador_candidatos_nacional(arq_candidatos_entrada); %'todos_candidatos.xml'

for i=1:length(sqCand) %varrer todos os registros
    strcat('Pct=',num2str((i/length(sqCand))*100),'%')
    arq=strcat(char(sqCand{i}),'.html');
    if(java.io.File(arq).exists==1) %testa se o arquivo já foi baixado
        disp(strcat('candidato ja baixado=',char(name{i})))
       continue; %nao baixar novamente, pular para proximo
    else
        html_doadores=lista_doadores_candidato_especifico(sqCand{i},sgUe{i},name{i},numero{i},partido{i});
        disp(strcat('candidato novo=',char(name{i})))
   
        fid=fopen(arq,'w');
        fwrite(fid,html_doadores);
        fclose(fid);
    end
end

