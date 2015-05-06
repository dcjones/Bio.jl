
module Intervals

import Base: show, isless, push!, intersect, start, next, done, length,
             convert, read, read!, ==

import Iterators
#using DataStructures
using Base.Intrinsics
using Color
using Compat
using Docile
using Docile: @doc, @doc_str
using IntervalTrees

import Bio: FileFormat

export Strand, Interval, IntervalCollection, IntervalStream,
       STRAND_NA, STRAND_POS, STRAND_NEG, STRAND_BOTH,
       isoverlapping, BED, BEDMetadata

include("interval.jl")
include("stream_buffer.jl")
include("intervalstream.jl")
include("intervalcollection.jl")

# Parsing file types
include("bed.jl")


end

