-module(rna_transcription).
-compile(export_all).

to_rna($G) -> $C;
to_rna($C) -> $G;
to_rna($T) -> $A;
to_rna($A) -> $U;
to_rna(L) -> lists:map(fun rna_transcription:to_rna/1, L).
