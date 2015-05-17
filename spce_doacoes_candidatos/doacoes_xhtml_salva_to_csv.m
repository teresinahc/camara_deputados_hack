function doacoes_xhtml_salva_to_csv()
% Funcao retorna gera um csv a partir de um conjunto de arquivos xhtml
% contendo as doacoes de politicos. O conjunto de arquivos precisa estar
% armazenadas em um diretorio chamado 'dados_brutos'
% 
% function xhtml_salva_to_csv()

%16horas
% fclose all;
tic
cd('dados_brutos') %entra em diretorio com arquivos xhtml de doacoes
ultimo_arq=[];
ind_file=[];
if(exist('ultimo_arq.mat')==1) %funcao para tentar retomar um csv anteriormente interrompida %TODO:Nunca testado, não sei se funciona
    load ultimo_arq
end
lista_dir=dir('*.xhtml');
arq_salvar='doadores_candidatos.csv';
fid=fopen(arq_salvar,'A'); %abre arquivo usando atributo de append
if(isempty(ultimo_arq)) %se for comecar do inicio
    ind_file=1;
else %senao comecar do meio
    for ind_file=1:length(lista_dir)
        arq=lista_dir(ind_file).name;
        if(strcmp(arq,ultimo_arq)==1)
            break
        end
    end
end
tam=length(lista_dir); %procura qtd de registros
for a=ind_file:tam
    arq=lista_dir(a).name;
   disp(strcat('Avanco =',num2str(a*100/tam),'%,arq_alvo=',arq)); %exibe quantidade de avanco

    [doador,cpfcnpj,doador_orig,cpfcnpjorig,Data,recibo_eleitoral,valor,especie,n_doc,nome_cand,CNPJ_can,num_cand,part_can,cand_cand,uf_can,fonte_recurso]=abre_arq_doacoes_xhtml(arq);
    if(isempty(doador)==1)
        disp('Nao gerando registro de csv, provavel não entrega da prestacao de contas pelo candidato ');
        continue

    end

    id_candidato=arq(1:end-6); %obtem numero de identificacao SPCE do candidato (removem a extensao .xhtml da string)

    %salvar cells no arquivo
        for i=1:length(doador)
            fprintf(fid,'%s;',id_candidato);
            fprintf(fid,'%s;',doador{i});
            fprintf(fid,'%s;',cpfcnpj{i});
            fprintf(fid,'%s;',doador_orig{i});
            fprintf(fid,'%s;',cpfcnpjorig{i});
            fprintf(fid,'%s;',Data{i});
            fprintf(fid,'%s;',recibo_eleitoral{i});
            fprintf(fid,'%s;',valor{i});
            fprintf(fid,'%s;',especie{i});
            fprintf(fid,'%s;',n_doc{i});
            fprintf(fid,'%s;',nome_cand{i});
            fprintf(fid,'%s;',CNPJ_can{i});
            fprintf(fid,'%s;',num_cand{i});
            fprintf(fid,'%s;',part_can{i});
            fprintf(fid,'%s;',uf_can{i});
            fprintf(fid,'%s;\n',fonte_recurso{i});
        end
        ultimo_arq=arq;
        save ultimo_arq ind_file %funcao para tentar retomar um csv anteriormente interrompida %TODO:Nunca testado, não sei se funciona
end
    fclose(fid) %fecha arquivo
    cd('..') %sai do diretorio
%    toc 