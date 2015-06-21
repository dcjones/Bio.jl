# WARNING: This file was generated from bigbeddata.rl using ragel. Do not edit!
type BigBedData
    reader::BufferedReader
    header::BigBedHeader
    zoom_headers::Vector{BigBedZoomHeader}
    autosql::String
    summary::BigBedTotalSummary
    btree_header::BigBedBTreeHeader
    rtree_header::BigBedRTreeHeader
    data_count::Uint32

    # preallocated space for reading and searching the B-tree
    btree_internal_nodes::Vector{BigBedBTreeInternalNode}
    btree_leaf_nodes::Vector{BigBedBTreeLeafNode}
    key::Vector{Uint8}
    node_keys::Vector{Vector{Uint8}}
    uncompressed_data::Vector{Uint8}
end


module BigBedDataParserImpl

import Bio.Ragel, Zlib
import Bio.Intervals: Strand, STRAND_NA, BEDInterval, BEDMetadata
using Color, Compat, Switch

# Parser for data blocks in a BigBed file. This is very similar
# to the BED parser in bed.rl, with the following exceptions:
#
#    * BigBed has binary chrom_index, start, and end, insteado of ASCII
#      chromosome name, start, end.
#    * BigBed entries are null ('\0') terminated, rather than newline separated.
#
const bigbed_start  = convert(Int , 39)
const bigbed_first_final  = convert(Int , 39)
const bigbed_error  = convert(Int , 0)
const bigbed_en_main  = convert(Int , 39)
type BigBedDataParser
    state::Ragel.State

    chrom_id::Uint32
    first::Int64
    last::Int64
    strand::Strand

    red::Float32
    green::Float32
    blue::Float32
    name::Nullable{String}
    score::Nullable{Int}
    thick_first::Nullable{Int}
    thick_last::Nullable{Int};
    item_rgb::Nullable{RGB{Float32}};
    block_count::Nullable{Int}
    block_sizes::Nullable{Vector{Int}}
    block_firsts::Nullable{Vector{Int}}

    function BigBedDataParser(input::Vector{Uint8}, len::Integer)
        cs = bigbed_start;
	return new(Ragel.State(cs, input, len),
                   0, 0, 0, STRAND_NA, 0.0, 0.0, 0.0,
                   Nullable{String}(), Nullable{Int}(), Nullable{Int}(),
                   Nullable{Int}(), Nullable{RGB{Float32}}(), Nullable{Int}(),
                   Nullable{Vector{Int}}(), Nullable{Vector{Int}}())
    end
end



Ragel.@generate_read_fuction("bigbed", BigBedDataParser, BigBedDataEntry,
    begin
        @inbounds begin
            if p == pe 
	@goto _test_eof

end
@switch cs  begin
    @case 39
@goto st_case_39
@case 1
@goto st_case_1
@case 2
@goto st_case_2
@case 3
@goto st_case_3
@case 4
@goto st_case_4
@case 5
@goto st_case_5
@case 6
@goto st_case_6
@case 7
@goto st_case_7
@case 8
@goto st_case_8
@case 9
@goto st_case_9
@case 10
@goto st_case_10
@case 11
@goto st_case_11
@case 12
@goto st_case_12
@case 0
@goto st_case_0
@case 40
@goto st_case_40
@case 13
@goto st_case_13
@case 14
@goto st_case_14
@case 15
@goto st_case_15
@case 16
@goto st_case_16
@case 17
@goto st_case_17
@case 18
@goto st_case_18
@case 19
@goto st_case_19
@case 20
@goto st_case_20
@case 21
@goto st_case_21
@case 22
@goto st_case_22
@case 23
@goto st_case_23
@case 24
@goto st_case_24
@case 25
@goto st_case_25
@case 26
@goto st_case_26
@case 27
@goto st_case_27
@case 28
@goto st_case_28
@case 29
@goto st_case_29
@case 30
@goto st_case_30
@case 31
@goto st_case_31
@case 32
@goto st_case_32
@case 33
@goto st_case_33
@case 34
@goto st_case_34
@case 35
@goto st_case_35
@case 36
@goto st_case_36
@case 37
@goto st_case_37
@case 38
@goto st_case_38

end
@goto st_out
@label st_case_39
@goto ctr65
@label ctr65
	Ragel.@mark! 
@goto st1
@label ctr66
	yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@mark!
        	p+= 1; cs = 1; @goto _out


    
	Ragel.@mark! 
@goto st1
@label st1
p+= 1;
	if p == pe 
	@goto _test_eof1

end
@label st_case_1
@goto st2
@label st2
p+= 1;
	if p == pe 
	@goto _test_eof2

end
@label st_case_2
@goto st3
@label st3
p+= 1;
	if p == pe 
	@goto _test_eof3

end
@label st_case_3
@goto st4
@label st4
p+= 1;
	if p == pe 
	@goto _test_eof4

end
@label st_case_4
@goto ctr3
@label ctr3
	m = Ragel.@unmark!
        input.chrom_id = unsafe_load(convert(Ptr{Uint32}, pointer(state.reader.buffer, m)))
    
	Ragel.@mark! 
@goto st5
@label st5
p+= 1;
	if p == pe 
	@goto _test_eof5

end
@label st_case_5
@goto st6
@label st6
p+= 1;
	if p == pe 
	@goto _test_eof6

end
@label st_case_6
@goto st7
@label st7
p+= 1;
	if p == pe 
	@goto _test_eof7

end
@label st_case_7
@goto st8
@label st8
p+= 1;
	if p == pe 
	@goto _test_eof8

end
@label st_case_8
@goto ctr7
@label ctr7
	m = Ragel.@unmark!
        input.first = unsafe_load(convert(Ptr{Uint32}, pointer(state.reader.buffer, m))) - 1
    
	Ragel.@mark! 
@goto st9
@label st9
p+= 1;
	if p == pe 
	@goto _test_eof9

end
@label st_case_9
@goto st10
@label st10
p+= 1;
	if p == pe 
	@goto _test_eof10

end
@label st_case_10
@goto st11
@label st11
p+= 1;
	if p == pe 
	@goto _test_eof11

end
@label st_case_11
@goto st12
@label st12
p+= 1;
	if p == pe 
	@goto _test_eof12

end
@label st_case_12
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr11
@case 9
@goto ctr13

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126 
	@goto ctr14

end
@goto st0
@label st_case_0
@label st0
cs = 0;
	@goto _out
@label ctr11
	m = Ragel.@unmark!
        input.last = unsafe_load(convert(Ptr{Uint32}, pointer(state.reader.buffer, m)))
    
	Ragel.@mark! 
	input.name         = Nullable{String}(Ragel.@asciistring_from_mark!) 
@goto st40
@label ctr16
	input.score        = Ragel.@int64_from_mark! 
@goto st40
@label ctr23
	input.thick_first  = Ragel.@int64_from_mark! 
@goto st40
@label ctr27
	input.thick_last   = Ragel.@int64_from_mark! 
@goto st40
@label ctr31
	input.red = input.green = input.blue = (Ragel.@int64_from_mark!) / 255.0 
	input.item_rgb     = RGB{Float32}(input.red, input.green, input.blue ) 
@goto st40
@label ctr46
	input.blue         = (Ragel.@int64_from_mark!) / 255.0 
	input.item_rgb     = RGB{Float32}(input.red, input.green, input.blue ) 
@goto st40
@label ctr49
	input.block_count  = Ragel.@int64_from_mark! 
@goto st40
@label ctr53
	if isnull(input.block_sizes)
            input.block_sizes = Array(Int, 0)
        end
        push!(get(input.block_sizes), (Ragel.@int64_from_mark!))
    
@goto st40
@label ctr58
	if isnull(input.block_firsts)
            input.block_firsts = Array(Int, 0)
        end
        push!(get(input.block_firsts), (Ragel.@int64_from_mark!))
    
@goto st40
@label ctr62
	input.name         = Nullable{String}(Ragel.@asciistring_from_mark!) 
@goto st40
@label st40
p+= 1;
	if p == pe 
	@goto _test_eof40

end
@label st_case_40
@goto ctr66
@label ctr13
	m = Ragel.@unmark!
        input.last = unsafe_load(convert(Ptr{Uint32}, pointer(state.reader.buffer, m)))
    
	Ragel.@mark! 
	input.name         = Nullable{String}(Ragel.@asciistring_from_mark!) 
@goto st13
@label ctr63
	input.name         = Nullable{String}(Ragel.@asciistring_from_mark!) 
@goto st13
@label st13
p+= 1;
	if p == pe 
	@goto _test_eof13

end
@label st_case_13
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr15

end
@goto st0
@label ctr15
	Ragel.@mark! 
@goto st14
@label st14
p+= 1;
	if p == pe 
	@goto _test_eof14

end
@label st_case_14
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr16
@case 9
@goto ctr17

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st14

end
@goto st0
@label ctr17
	input.score        = Ragel.@int64_from_mark! 
@goto st15
@label st15
p+= 1;
	if p == pe 
	@goto _test_eof15

end
@label st_case_15
@switch ( data[1 + p ])  begin
    @case 43
@goto ctr19
@case 63
@goto ctr19

end
if 45 <= ( data[1 + p ]) && ( data[1 + p ]) <= 46 
	@goto ctr19

end
@goto st0
@label ctr19
	input.strand       = convert(Strand, Ragel.@char) 
@goto st16
@label st16
p+= 1;
	if p == pe 
	@goto _test_eof16

end
@label st_case_16
@switch ( data[1 + p ])  begin
    @case 0
@goto st40
@case 9
@goto st17

end
@goto st0
@label st17
p+= 1;
	if p == pe 
	@goto _test_eof17

end
@label st_case_17
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr22

end
@goto st0
@label ctr22
	Ragel.@mark! 
@goto st18
@label st18
p+= 1;
	if p == pe 
	@goto _test_eof18

end
@label st_case_18
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr23
@case 9
@goto ctr24

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st18

end
@goto st0
@label ctr24
	input.thick_first  = Ragel.@int64_from_mark! 
@goto st19
@label st19
p+= 1;
	if p == pe 
	@goto _test_eof19

end
@label st_case_19
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr26

end
@goto st0
@label ctr26
	Ragel.@mark! 
@goto st20
@label st20
p+= 1;
	if p == pe 
	@goto _test_eof20

end
@label st_case_20
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr27
@case 9
@goto ctr28

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st20

end
@goto st0
@label ctr28
	input.thick_last   = Ragel.@int64_from_mark! 
@goto st21
@label st21
p+= 1;
	if p == pe 
	@goto _test_eof21

end
@label st_case_21
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr30

end
@goto st0
@label ctr30
	Ragel.@mark! 
@goto st22
@label st22
p+= 1;
	if p == pe 
	@goto _test_eof22

end
@label st_case_22
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr31
@case 9
@goto ctr32
@case 11
@goto ctr33
@case 32
@goto ctr33
@case 44
@goto ctr34

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st22

end
@goto st0
@label ctr32
	input.red = input.green = input.blue = (Ragel.@int64_from_mark!) / 255.0 
	input.item_rgb     = RGB{Float32}(input.red, input.green, input.blue ) 
@goto st23
@label st23
p+= 1;
	if p == pe 
	@goto _test_eof23

end
@label st_case_23
@switch ( data[1 + p ])  begin
    @case 9
@goto st24
@case 11
@goto st24
@case 32
@goto st24
@case 44
@goto st25

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr38

end
@goto st0
@label ctr33
	input.red = input.green = input.blue = (Ragel.@int64_from_mark!) / 255.0 
@goto st24
@label st24
p+= 1;
	if p == pe 
	@goto _test_eof24

end
@label st_case_24
@switch ( data[1 + p ])  begin
    @case 9
@goto st24
@case 11
@goto st24
@case 32
@goto st24
@case 44
@goto st25

end
@goto st0
@label ctr34
	input.red = input.green = input.blue = (Ragel.@int64_from_mark!) / 255.0 
@goto st25
@label st25
p+= 1;
	if p == pe 
	@goto _test_eof25

end
@label st_case_25
@switch ( data[1 + p ])  begin
    @case 9
@goto st25
@case 11
@goto st25
@case 32
@goto st25

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr39

end
@goto st0
@label ctr39
	Ragel.@mark! 
@goto st26
@label st26
p+= 1;
	if p == pe 
	@goto _test_eof26

end
@label st_case_26
@switch ( data[1 + p ])  begin
    @case 9
@goto ctr40
@case 11
@goto ctr40
@case 32
@goto ctr40
@case 44
@goto ctr41

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st26

end
@goto st0
@label ctr40
	input.green        = (Ragel.@int64_from_mark!) / 255.0 
@goto st27
@label st27
p+= 1;
	if p == pe 
	@goto _test_eof27

end
@label st_case_27
@switch ( data[1 + p ])  begin
    @case 9
@goto st27
@case 11
@goto st27
@case 32
@goto st27
@case 44
@goto st28

end
@goto st0
@label ctr41
	input.green        = (Ragel.@int64_from_mark!) / 255.0 
@goto st28
@label st28
p+= 1;
	if p == pe 
	@goto _test_eof28

end
@label st_case_28
@switch ( data[1 + p ])  begin
    @case 9
@goto st28
@case 11
@goto st28
@case 32
@goto st28

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr45

end
@goto st0
@label ctr45
	Ragel.@mark! 
@goto st29
@label st29
p+= 1;
	if p == pe 
	@goto _test_eof29

end
@label st_case_29
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr46
@case 9
@goto ctr47

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st29

end
@goto st0
@label ctr47
	input.blue         = (Ragel.@int64_from_mark!) / 255.0 
	input.item_rgb     = RGB{Float32}(input.red, input.green, input.blue ) 
@goto st30
@label st30
p+= 1;
	if p == pe 
	@goto _test_eof30

end
@label st_case_30
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr38

end
@goto st0
@label ctr38
	Ragel.@mark! 
@goto st31
@label st31
p+= 1;
	if p == pe 
	@goto _test_eof31

end
@label st_case_31
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr49
@case 9
@goto ctr50

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st31

end
@goto st0
@label ctr50
	input.block_count  = Ragel.@int64_from_mark! 
@goto st32
@label st32
p+= 1;
	if p == pe 
	@goto _test_eof32

end
@label st_case_32
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr52

end
@goto st0
@label ctr52
	Ragel.@mark! 
@goto st33
@label st33
p+= 1;
	if p == pe 
	@goto _test_eof33

end
@label st_case_33
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr53
@case 9
@goto ctr54
@case 44
@goto ctr55

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st33

end
@goto st0
@label ctr54
	if isnull(input.block_sizes)
            input.block_sizes = Array(Int, 0)
        end
        push!(get(input.block_sizes), (Ragel.@int64_from_mark!))
    
@goto st34
@label st34
p+= 1;
	if p == pe 
	@goto _test_eof34

end
@label st_case_34
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr57

end
@goto st0
@label ctr57
	Ragel.@mark! 
@goto st35
@label st35
p+= 1;
	if p == pe 
	@goto _test_eof35

end
@label st_case_35
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr58
@case 44
@goto ctr59

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto st35

end
@goto st0
@label ctr59
	if isnull(input.block_firsts)
            input.block_firsts = Array(Int, 0)
        end
        push!(get(input.block_firsts), (Ragel.@int64_from_mark!))
    
@goto st36
@label st36
p+= 1;
	if p == pe 
	@goto _test_eof36

end
@label st_case_36
if ( data[1 + p ]) == 0 
	@goto st40

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr57

end
@goto st0
@label ctr55
	if isnull(input.block_sizes)
            input.block_sizes = Array(Int, 0)
        end
        push!(get(input.block_sizes), (Ragel.@int64_from_mark!))
    
@goto st37
@label st37
p+= 1;
	if p == pe 
	@goto _test_eof37

end
@label st_case_37
@switch ( data[1 + p ])  begin
    @case 0
@goto st40
@case 9
@goto st34

end
if 48 <= ( data[1 + p ]) && ( data[1 + p ]) <= 57 
	@goto ctr52

end
@goto st0
@label ctr14
	m = Ragel.@unmark!
        input.last = unsafe_load(convert(Ptr{Uint32}, pointer(state.reader.buffer, m)))
    
	Ragel.@mark! 
@goto st38
@label st38
p+= 1;
	if p == pe 
	@goto _test_eof38

end
@label st_case_38
@switch ( data[1 + p ])  begin
    @case 0
@goto ctr62
@case 9
@goto ctr63

end
if 32 <= ( data[1 + p ]) && ( data[1 + p ]) <= 126 
	@goto st38

end
@goto st0
@label st_out
@label _test_eof1
cs = 1; @goto _test_eof
@label _test_eof2
cs = 2; @goto _test_eof
@label _test_eof3
cs = 3; @goto _test_eof
@label _test_eof4
cs = 4; @goto _test_eof
@label _test_eof5
cs = 5; @goto _test_eof
@label _test_eof6
cs = 6; @goto _test_eof
@label _test_eof7
cs = 7; @goto _test_eof
@label _test_eof8
cs = 8; @goto _test_eof
@label _test_eof9
cs = 9; @goto _test_eof
@label _test_eof10
cs = 10; @goto _test_eof
@label _test_eof11
cs = 11; @goto _test_eof
@label _test_eof12
cs = 12; @goto _test_eof
@label _test_eof40
cs = 40; @goto _test_eof
@label _test_eof13
cs = 13; @goto _test_eof
@label _test_eof14
cs = 14; @goto _test_eof
@label _test_eof15
cs = 15; @goto _test_eof
@label _test_eof16
cs = 16; @goto _test_eof
@label _test_eof17
cs = 17; @goto _test_eof
@label _test_eof18
cs = 18; @goto _test_eof
@label _test_eof19
cs = 19; @goto _test_eof
@label _test_eof20
cs = 20; @goto _test_eof
@label _test_eof21
cs = 21; @goto _test_eof
@label _test_eof22
cs = 22; @goto _test_eof
@label _test_eof23
cs = 23; @goto _test_eof
@label _test_eof24
cs = 24; @goto _test_eof
@label _test_eof25
cs = 25; @goto _test_eof
@label _test_eof26
cs = 26; @goto _test_eof
@label _test_eof27
cs = 27; @goto _test_eof
@label _test_eof28
cs = 28; @goto _test_eof
@label _test_eof29
cs = 29; @goto _test_eof
@label _test_eof30
cs = 30; @goto _test_eof
@label _test_eof31
cs = 31; @goto _test_eof
@label _test_eof32
cs = 32; @goto _test_eof
@label _test_eof33
cs = 33; @goto _test_eof
@label _test_eof34
cs = 34; @goto _test_eof
@label _test_eof35
cs = 35; @goto _test_eof
@label _test_eof36
cs = 36; @goto _test_eof
@label _test_eof37
cs = 37; @goto _test_eof
@label _test_eof38
cs = 38; @goto _test_eof
@label _test_eof
if p == eof 
	@switch cs  begin
    @case 40
	yield = true
        # // fbreak causes will cause the pushmark action for the next seqname
        # // to be skipped, so we do it here
        Ragel.@mark!
        	p+= 1; cs = 0; @goto _out


    

	break;
	
end

end
@label _out
end
    end,
    begin
    end)


end # module BigBedDataParserImpl

