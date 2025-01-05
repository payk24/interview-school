module Schedules
  class ExportService
    MONTSERRAT_FONT_PATH = "app/assets/stylesheets/Montserrat-Medium.ttf"
    MONTSERRAT_BOLD_FONT_PATH = "app/assets/stylesheets/Montserrat-Black.ttf"

    def initialize(student)
      @student = student
    end

    def call
      Date::DAYNAMES.each_with_index do |day, index|
        pdf.table(schedules_week_day(day) + schedules_by_num_day(index), day_section_options) do |table|
          table.row(0).border_width = 0.5
          table.row(0).text_color = "888892"
          table.row(0).padding = [ 10, 15 ]
        end
      end
      pdf.render
    end

    private

    def pdf
      return @pdf if defined?(@pdf)

      @pdf = Prawn::Document.new
      @pdf.font_families.update("montserrat" => { normal: MONTSERRAT_FONT_PATH, bold: MONTSERRAT_BOLD_FONT_PATH })
      @pdf
    end

    def day_section_options
      {
        width: pdf.bounds.width,
        row_colors: [ "ffffff" ],
        cell_style: { border_width: 0, borders: [ :bottom ], border_color: "c9ced5", padding: [ 10, 15 ] }
      }
    end

    def schedules_week_day(day)
      [ [ day, "", "", "", "" ] ]
    end

    def schedules_by_num_day(num_day)
      @student.schedules.
        includes(section: [ :classroom, :subject, :teacher ]).
        where("sections.days_of_week && :day", day: "{#{num_day}}").
        order("sections.start_at ASC, sections.end_at ASC").
        map do |schedule|
        [
          schedule.section.subject.name,
          schedule.section.start_at.strftime("%H:%M"),
          schedule.section.end_at.strftime("%H:%M"),
          schedule.section.teacher.full_name,
          "#{schedule.classroom.number} (#{schedule.classroom.name})"
        ]
      end
    end
  end
end
