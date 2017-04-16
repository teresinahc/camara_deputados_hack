function candidatos_xml_salva_to_csv()
% Funcao retorna gera um csv a partir da lista de candidatos xml.
% 
% candidatos_xml_salva_to_csv()

tic

arq_salvar='candidatos_id.csv';
fid=fopen(arq_salvar,'w'); %abre arquivo usando atributo de append
arq='todos_candidatos.xml';
    [sqCand,sgUe,name,numero,partido]=identificador_candidatos_nacional(arq);
    %salvar cells no arquivo
        for i=1:length(sqCand)
            fprintf(fid,'%s;',char(sqCand{i}));
            fprintf(fid,'%s;',char(sgUe{i}));
            fprintf(fid,'%s;',char(name{i}));
            fprintf(fid,'%s;',char(numero{i}));
            fprintf(fid,'%s;\n',char(partido{i}));
        end
    fclose(fid) %fecha arquivo
toc 