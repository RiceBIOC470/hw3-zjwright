function function_answer=accession_finder(accession_num, N)
function_answer={};
accession_info=getgenbank(accession_num);
[requestID, requestTime]=blastncbi(accession_info.Sequence, 'blastn', 'Database', 'refseq_rna');
accession_blast_data = getblast(requestID,'WaitTime',requestTime);
matching_accessions = accession_blast_data.Hits(1:N);
x = matching_accessions;
    for y = 1:N 
        xx = x(y).Name;
        accession_cells = strsplit(xx ,'|');
        answer(1,y) = accession_cells(4);
    end
    function_answer = answer;