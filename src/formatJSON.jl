
convert_to_JSON(dataElement::AbstractSpdx, unused::Nothing)= string(dataElement)  # Default
convert_to_JSON(stringElement::AbstractString, unused)= stringElement
convert_to_JSON(boolval::Bool, unused)= boolval

function convert_to_JSON(doc::Union{AbstractSpdxData, AbstractSpdxElement}, NameTable::Table)
    jsonDoc= OrderedDict{String, Any}()
    for idx in range(1,length= length(NameTable))
        fieldval= getproperty(doc, NameTable.Symbol[idx])
        (ismissing(fieldval) || (isa(fieldval, Vector) && isempty(fieldval))) && continue  # goto next symbol if this one has no data
        isnothing(fieldval) && error("Field " * string(NameTable.Symbol[idx]) * "== nothing")  # This should not happen, but check just in case
        
        if isa(fieldval, Vector)
            elementVector= Vector{Any}()
            for element in fieldval
                push!(elementVector, convert_to_JSON(element, NameTable.NameTable[idx]))
            end
            jsonDoc[NameTable.JSONname[idx]]= elementVector
        else
            jsonDoc[NameTable.JSONname[idx]]= convert_to_JSON(fieldval, NameTable.NameTable[idx])
        end
    end

    compute_additional_JSON_fields!(jsonDoc, doc)
    return jsonDoc
end

#########################
compute_additional_JSON_fields!(jsonDoc, doc)= nothing

# These fields are derived from the document contents
function compute_additional_JSON_fields!(jsonDoc::OrderedDict{String, Any}, doc::SpdxDocumentV2)
    docDescribes= Vector{String}()
    for element in doc.Relationships
        if element.RelationshipType == "DESCRIBES" && element.SPDXID == "SPDXRef-DOCUMENT" 
            push!(docDescribes, element.RelatedSPDXID)
        elseif element.RelationshipType == "DESCRIBED_BY" && element.RelatedSPDXID == "SPDXRef-DOCUMENT"
            push!(docDescribes, element.SPDXID)
        end
    end
    jsonDoc["documentDescribes"]= docDescribes
end
