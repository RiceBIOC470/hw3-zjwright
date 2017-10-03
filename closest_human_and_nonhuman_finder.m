function [closest_human, closest_nonhuman]=closest_human_and_nonhuman_finder(accession_number)
accession_list=accession_finder(accession_number,20); 
    for ii=1:length(accession_list)
        accession=getgenbank(char(accession_list(ii)));
        if contains(accession.Source, 'Homo sapiens (human)') && exist('closest_human', 'var')
            closest_human=accession(ii);
            break
        elseif ~contains(accession.Source, 'Homo sapiens (human)') && exist('closest_nonhuman', 'var')
            closest_nonhuman=accession(ii);
            break
        end
    end
    if ~exist('closest_human', 'var')
        disp('No human sequnece found in first 20 hits')
    end
end
            
