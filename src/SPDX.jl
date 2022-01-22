# TODO: Put SPDX license header here
module SPDX

using JSON
using DataStructures
using TypedTables
using Dates
using UUIDs
using TimeZones

export AbstractSpdx, AbstractSpdxData, SpdxPackageV2, SpdxSimpleLicenseExpressionV2, SpdxPackageExternalReferenceV2, SpdxNamespaceV2
export SpdxDocumentV2, SpdxCreatorV2, SpdxDocumentExternalReferenceV2, SpdxRelationshipV2, SpdxCreationInfoV2, SpdxChecksumV2
export printJSON, setcreationtime!, SpdxTimeV2, createnamespace!, updatenamespace!
export addcreator!, getcreators, deletecreator!, printTagValue, readJSON, readTagValue


# Type creation
abstract type AbstractSpdx end
abstract type AbstractSpdxElement <: AbstractSpdx end
abstract type AbstractSpdxData <: AbstractSpdx end


function init_MutableFields(NameTable::Table)
    MutableIndicies= findall(NameTable.Mutable)
    MutableFields= OrderedDict{Symbol, Any}(NameTable.Symbol[MutableIndicies] .=> deepcopy(NameTable.Default[MutableIndicies]))
    return MutableFields
end


include("types.jl")
include("spdxRelationship.jl")
include("spdxPackage.jl")
include("spdxDocument.jl")
include("accessors.jl")
include("display.jl")
include("formatJSON.jl")
include("formatTagValue.jl")
include("readJSON.jl")
include("readTagValue.jl")
include("api.jl")

# Write your package code here.



end
