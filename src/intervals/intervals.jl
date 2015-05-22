
module Intervals

import Base: show, isless, push!, shift!, intersect, start, next, done, length,
             convert, read, read!, write, getindex, get, isempty, endof, ==,
             reverse!

import Iterators
import Zlib
#using DataStructures
using Base.Intrinsics
using Color
using Compat
using Docile
using Docile: @doc, @doc_str
using IntervalTrees
import IntervalTrees: first, last

import Bio: FileFormat

export Strand, Interval, IntervalCollection, IntervalStream,
       STRAND_NA, STRAND_POS, STRAND_NEG, STRAND_BOTH,
       coverage, isoverlapping, BED, BEDMetadata, BigBed

include("interval.jl")
include("stream_buffer.jl")
include("intervalcollection.jl")
include("intervalstream.jl")

# Parsing file types
include("bed.jl")

# TODO: reorg
include("bigbedwig.jl")
include("bigbed.jl")

end

