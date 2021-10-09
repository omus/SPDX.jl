const SpdxPackageV2_NameTable= Table(  
     Symbol= [ :SPDXID,  :Name,    :Version, :FileName, :Supplier, :Originator, :DownloadLocation, :FilesAnalyzed, :VerificationCode, :Checksums,        :HomePage, :SourceInfo, :LicenseConcluded, :LicenseInfoFromFiles,                    :LicenseDeclared, :LicenseComments, :Copyright, :Summary, :DetailedDescription, :Comment, :ExternalReferences,                   :ExternalReferenceComment, :Attributions],
    Default= [  nothing,  missing,  missing,  missing,   missing,   missing,     missing,           missing,        missing,           Vector{String}(),  missing,   missing,     missing,           Vector{SpdxSimpleLicenseExpressionV2}(),  missing,          missing,          missing,    missing,  missing,              missing,  Vector{PackageExternalReferenceV2}(),  missing,                   Vector{String}()],
    Mutable= [  false,    true,     true,     true,      true,      true,        true,              true,           true,              true,              true,      true,        true,              true,                                     true,             true,             true,       true,     true,                 true,     true,                                  true,                      true]
)

const SpdxDocumentV2_NameTable= Table(
     Symbol= [ :Version, :DataLicense, :SPDXID,  :Name,     :Namespace, :ExternalReferences,                    :LicenseListVersion, :Creator,                 :Created, :CreatorComment, :DocumentComment, :Packages,                 :Relationships],
    Default= [  nothing,  nothing,      nothing,  missing,   missing,    Vector{DocumentExternalReferenceV2}(),  missing,             Vector{SpdxCreatorV2}(),  missing,  missing,         missing,          Vector{SpdxPackageV2}(),   Vector{SpdxRelationshipV2}()],
    Mutable= [  false,    false,        false,    true,      true,       true,                                   true,                true,                     true,     true,            true,             true,                      true]
)