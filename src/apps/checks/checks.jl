module Checks

import ..GitHub: @ghdef, GitHubType, namefield
export Action, Image, Annotation, Output

@ghdef mutable struct Action
    label::String
    description::String
    identifier::String
end
namefield(act::Action) = act.label

@ghdef mutable struct Image
    alt::String
    image_url::String
    caption::Union{String, Nothing}
end
namefield(img::Image) = img.alt

@ghdef mutable struct Annotation
    path::String
    start_line::Int
    end_line::Int
    start_column::Union{Int, Nothing}
    end_column::Union{Int, Nothing}
    annotation_level::String
    message::String
    title::Union{String, Nothing}
    raw_details::Union{String, Nothing}
end
namefield(ann::Annotation) = ann.filename

@ghdef mutable struct Output
    title::String
    summary::String
    text::Union{String, Nothing}
    annotations::Union{Vector{Annotation}, Nothing}
    images::Union{Vector{Image}, Nothing}
end
namefield(out::Output) = out.title

end
using .Checks
