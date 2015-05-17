function [doador,cpfcnpj,doador_orig,cpfcnpjorig,Data,recibo_eleitoral,valor,especie,n_doc,nome_cand,CNPJ_can,num_cand,part_can,cand_cand,uf_can,fonte_recurso]=abre_arq_doacoes_xhtml(arq)
%  funcao retorna o conteudo do xhtml contendo as doacoes dos candidatos. É
%  capaz de lidar com arquivos em que não ocorreu prestação de contas por
%  parte do candidato.
% Retorna variaveis do tipo cell
% 
% function [doador,cpfcnpj,doador_orig,cpfcnpjorig,Data,recibo_eleitoral,valor,especie,n_doc,nome_cand,CNPJ_can,num_cand,part_can,cand_cand,uf_can,fonte_recurso]=abre_arq_doacoes_xhtml(arq)
doador={};
cpfcnpj={};
doador_orig={};
cpfcnpjorig={};
Data={};
recibo_eleitoral={};
valor={};
especie={};
n_doc={};
nome_cand={};
CNPJ_can={};
num_cand={};
part_can={};
cand_cand={};
uf_can={};
fonte_recurso={};

%abre arquivo local e transforma o conteudo de xml->dom->struct
xhtml_struct=parseXML(arq);

body=xhtml_struct.Children(4);
form_pesq=body.Children(2); 
table_main=form_pesq.Children(8);
tr_doacoes=table_main.Children(8); 
td_doacoes=tr_doacoes.Children(2);
%detecta prestacao de doacao invalida
if(length(td_doacoes.Children)==1)
    disp('prestacao de conta invalida(nao entregue ou sem receitas)')
    return;
end
tab_cab_doacoes=td_doacoes.Children(2); %cabecalho com codigo de entrega de prestacao de contas;(nao usado ainda)

%tabela alvo
tab_doadores=td_doacoes.Children(5);
%extrai cada linho de registro de doador e armazena em variavel para
%retorno
for i=2:(length(tab_doadores.Children)-1)/2 

    doador{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(2).Children(1).Data);
    cpfcnpj{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(4).Children(1).Data);
    doador_orig{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(6).Children(1).Data);
    cpfcnpjorig{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(8).Children(1).Data);
    Data{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(10).Children(1).Data);
    recibo_eleitoral{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(12).Children(1).Data);
    valor{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(14).Children(1).Data);
    especie{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(16).Children(1).Data);
    n_doc{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(18).Children(1).Data);
    nome_cand{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(20).Children(1).Data);
    CNPJ_can{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(22).Children(1).Data);
    num_cand{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(24).Children(1).Data);
    part_can{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(26).Children(1).Data);
    cand_cand{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(28).Children(1).Data);
    uf_can{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(30).Children(1).Data);
    if(isempty(tab_doadores.Children(i*2).Children(32).Children))
        fonte_recurso{i-1}='';
    else
        fonte_recurso{i-1}=remove_caracteres_indesejados(tab_doadores.Children(i*2).Children(32).Children(1).Data);
    end

end
