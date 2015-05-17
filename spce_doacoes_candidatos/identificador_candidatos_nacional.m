function [sqCand,sgUe,name,numero,partido]=identificador_candidatos_nacional(arq)
% Funcao que abre o xml de retorno da chamada de 
% [sqCand,sgUe,name,numero,partido]=identificador_candidatos_nacional(arq);

domnode=xmlread(arq);
resposta=domnode.getDocumentElement;
allListItems = domnode.getElementsByTagName('sqCand');
    for i=0:allListItems.getLength-1
          thisListItem = allListItems.item(i);
         childNode=thisListItem.getFirstChild;
         sqCand{i+1}=childNode.getData;
    end
    
    allListItems = domnode.getElementsByTagName('sgUe');
    for i=0:allListItems.getLength-1
          thisListItem = allListItems.item(i);
         childNode=thisListItem.getFirstChild;
         sgUe{i+1}=childNode.getData;
    end
 allListItems = domnode.getElementsByTagName('name');
    for i=0:allListItems.getLength-1
          thisListItem = allListItems.item(i);
         childNode=thisListItem.getFirstChild;
         name{i+1}=childNode.getData;
    end
 allListItems = domnode.getElementsByTagName('numero');
    for i=0:allListItems.getLength-1
          thisListItem = allListItems.item(i);
         childNode=thisListItem.getFirstChild;
         numero{i+1}=childNode.getData;
    end
    allListItems = domnode.getElementsByTagName('partido');
    for i=0:allListItems.getLength-1
          thisListItem = allListItems.item(i);
         childNode=thisListItem.getFirstChild;
         partido{i+1}=childNode.getData;
    end
