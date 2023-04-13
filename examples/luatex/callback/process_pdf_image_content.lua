pdf.setrecompress(1)

callback.register("process_pdf_image_content", function(s)
    print(s)
    return s
end)
