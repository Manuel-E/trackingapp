class Api::V1::PackagesController < Api::V1::BaseController
	def get_package_by_tracking_id
    @package=Package.no_state("Entregado").find_by_tracking_id!(params[:tracking_id])
    render(json: @package.state.name)
  end
end